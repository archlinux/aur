# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Antonio Rojas <arojas at archlinux dot org>
# Contributor: Kuba Serafinowski <zizzfizzix at gmail dot com>
# Contributor: Teo Mrnjavac <teo at kde dot org>

pkgname=qtkeychain-qt4
_pkgname=qtkeychain
pkgver=0.6.1
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=('i686' 'x86_64')
url='https://github.com/frankosterfeld/qtkeychain'
license=('BSD')
depends=('qt4')
makedepends=('cmake')
optdepends=('gnome-keyring: GNOME password manager')
source=("${_pkgname}-${pkgver}.zip::https://github.com/frankosterfeld/qtkeychain/archive/${pkgver}.zip")
md5sums=('d58f7ea3d85392cf80afc4b956fbd5c0')

prepare() {
    rm -rf build
    mkdir -p build
}

build() {
    cd build
    cmake "../${_pkgname}-${pkgver}" \
          -DBUILD_WITH_QT4=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
          -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
