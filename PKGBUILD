# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

MINGW_PACKAGE_PREFIX=mingw-w64

_pkgname=srain-git
pkgname=${MINGW_PACKAGE_PREFIX}-${_pkgname}
_pkgver=1.0.0rc1
pkgver=1.0.0rc1.1067.0542dd1
pkgrel=1
pkgdesc="Modern IRC client, git version (mingw-w64)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://srain.im"
makedepends=("git"
             "make"
             "${MINGW_PACKAGE_PREFIX}-gcc"
             "${MINGW_PACKAGE_PREFIX}-pkg-config"
             "${MINGW_PACKAGE_PREFIX}-gettext")
depends=("${MINGW_PACKAGE_PREFIX}-gtk3"
         "${MINGW_PACKAGE_PREFIX}-libconfig"
         "${MINGW_PACKAGE_PREFIX}-libsoup")
optdepends=("${MINGW_PACKAGE_PREFIX}-glib-networking: TLS connection support")
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/SilverRainZ/srain.git#branch=master")
sha256sums=('SKIP')

_prefix='/usr'

pkgver() {
    cd ${pkgname%-git}
    echo "${_pkgver}.$(git rev-list --count HEAD).$(git describe --always)"
}


build() {
    cd ${_pkgname%-git}

    ./configure                     \
        --prefix=${_prefix}         \
        --datadir=${_prefix}/share  \
        --sysconfdir=/etc           \
        --disable-debug
    make
}

package() {
    cd ${_pkgname%-git}

    make DESTDIR=${pkgdir} install
}
