# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasmate-git
pkgver=r.
pkgrel=1
pkgdesc="Plasma Applet Development Environment "
arch=('i686' 'x86_64')
url="https://community.kde.org/Plasma/PlasMate"
license=('GPL')
depends=('plasma-sdk')
makedepends=('git' 'extra-cmake-modules')
conflicts=("plasmate")
provides=("plasmate")
source=("git+git://anongit.kde.org/plasmate.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitpkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/plasmate

    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd "$srcdir"/plasmate/build
    make install DESTDIR="${pkgdir}"
}
