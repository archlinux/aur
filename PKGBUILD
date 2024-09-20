# Maintainer: Srijan Choudhary <dev@srijan.ch>
# Contributor: Lasath Fernando <devel@lasath.org>

pkgname=plasma6-applets-kargos-git
pkgver=r104.71c2c62
pkgrel=1
pkgdesc="KDE Plasma port of GNOME Argos and OSX BitBar - plasma6 version"
arch=('any')
url="https://github.com/sanniou/kargos"
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
source=("${pkgname%-git}::git+https://github.com/sanniou/kargos.git#branch=master")
noextract=()
md5sums=('SKIP')

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
