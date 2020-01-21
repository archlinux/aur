# Maintainer: Wilken 'Akiko' Gottwalt <akiko at mailbox dot org>

pkgname=gnoga
pkgver=1.5a
pkgrel=2
pkgdesc="Ada native GUI framework similar to the Electron framework"
arch=('i686' 'x86_64')
url="http://www.gnoga.com/"
license=('GPL3')
depends=('libgpr')
makedepends=('git' 'gprbuild' 'libgpr')
provides=('gnoga')
source=("https://downloads.sourceforge.net/project/gnoga/gnoga-${pkgver}.zip")
md5sums=('9f990015427d0b713f2a918b4f2469f0')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    #sed -i 's/BUILD_MODE=Debug/BUILD_MODE=Release/g' Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make -j1 BUILD_MODE=Release all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make -j1 PREFIX="$pkgdir/usr" BUILD_MODE=Release install
    cp "${srcdir}/${pkgname}-${pkgver}/settings.gpr" "${pkgdir}/usr/share/gpr/settings.gpr"
}
