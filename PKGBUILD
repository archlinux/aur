# Maintainer: Jonathan <greenbigfrog@gmail.com>
_pkgname=okcash
pkgname=okcash-git
pkgver=r164.784546e
pkgrel=1
pkgdesc="Okcash Qt Wallet, git version"
arch=('i686' 'x86_64')
url="http://okcash.co"
license=('MIT')
makedepends=('git' 'boost')
depends=('boost-libs' 'openssl')
optdepends=(
    'miniupnpc: adds UPnP'
    'qrencode: adds qr code functionality'
)
provides=('okcash')
conflicts=('okcash')
source=('git+https://github.com/okcashpro/okcash.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake
    make -j9
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "okcash" "${pkgdir}/usr/bin/okcash"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/okcash/LICENSE"
    install -d "${pkgdir}/usr/share/doc/okcash"
    cp -a "doc/" "${pkgdir}/usr/share/doc/okcash/"
}
