# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanogui-git
pkgver=r344.f9c3b7a
pkgrel=1
pkgdesc="NanoGUI is a minimalistic cross-platform widget library for OpenGL 3.x or higher."
arch=("x86_64")
url="https://github.com/wjakob/nanogui"
license=('BSD')
groups=()
depends=('eigen' 'glfw' 'nanovg' 'pybind11')
makedepends=('git' 'cmake' 'make')
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
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt.
}
