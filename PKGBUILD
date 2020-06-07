# Maintainer: Lasath Fernando <devel@lasath.org>
pkgname=plasma5-applets-kargos-git
pkgver=r85.e115334
pkgrel=1
pkgdesc="KDE Plasma port of GNOME Argos and OSX BitBar"
arch=('any')
url="https://github.com/lipido/kargos"
license=('GPL-3.0')
groups=()
depends=()
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/lipido/kargos.git#branch=master")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)";
}

prepare() {
	cd "$srcdir/${pkgname%-git}";
    mkdir -p build;
}

build() {
	cd "$srcdir/${pkgname%-git}"

    cd build;
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

    cd build
    make DESTDIR="$pkgdir/" install
}
