# Maintainer: Gabriel Laskar <gabriel@lse.epita.fr>
pkgname=wayland-ivi-extension-git
pkgver=1.9.1
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="http://git.projects.genivi.org/?p=wayland-ivi-extension.git"
license=('Apache')
groups=()
depends=('weston')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('wayland-ivi-extension::git://git.projects.genivi.org/wayland-ivi-extension.git#tag=1.9.1')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --tags)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
