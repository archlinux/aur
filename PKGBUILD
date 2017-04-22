# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanogui-git
pkgver=VERSION
pkgrel=1
pkgdesc="NanoGUI is a minimalistic cross-platform widget library for OpenGL 3.x or higher."
arch=("x86_64")
url="https://github.com/wjakob/nanogui"
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('nanogui::git+https://github.com/wjakob/nanogui')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive	
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install LICENSE.txt /usr/share/licenses/${pkgname%-git}/.
}
