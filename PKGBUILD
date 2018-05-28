# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=srain-git
pkgname=mingw-w64-${_pkgname}
pkgver=0.988.bbc3da0
pkgrel=1
pkgdesc="Modern, beautiful IRC client written in GTK+ 3, git version (mingw-w64)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://srain.im"
makedepends=("git"
             "make"
             "${MINGW_PACKAGE_PREFIX}-gcc"
             "${MINGW_PACKAGE_PREFIX}-pkg-config"
             "${MINGW_PACKAGE_PREFIX}-gettext"
             "${MINGW_PACKAGE_PREFIX}-imagemagick")
depends=("${MINGW_PACKAGE_PREFIX}-gtk3"
         "${MINGW_PACKAGE_PREFIX}-libconfig"
         "${MINGW_PACKAGE_PREFIX}-libsoup")
optdepends=("${MINGW_PACKAGE_PREFIX}-glib-networking: TLS connection support")
conflicts=('srain')
provides=('srain')
source=("git+https://github.com/SilverRainZ/srain.git#branch=mingw")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname%-git}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd ${_pkgname%-git}

    export PATH=${MINGW_PREFIX}/bin:${PATH}
    ./configure --prefix=${MINGW_PREFIX} --config-dir=${MINGW_PREFIX}/etc --disable-debug
    make
}

package() {
    cd ${_pkgname%-git}

    export PATH=${MINGW_PREFIX}/bin:${PATH}
    make DESTDIR=${pkgdir} install
}
