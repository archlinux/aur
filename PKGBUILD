# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Fabian Köhler <fabian.koehler (AT) protonmail.ch>
pkgname=dieharder
pkgver=3.31.2
pkgrel=2
pkgdesc="A Random Number Test Suite"
arch=('i686' 'x86_64')
makedepends=('gsl')
url="https://github.com/christopherkobayashi/dieharder"
license=('GPL2')
source=(
    "https://github.com/christopherkobayashi/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
b2sums=(
    '6584fd10b723d8083918d474ce00c9bb387e29ff04d21be41779f297d850d688aedf9e675c18a543f8b0babafe7828049c36b13a112ba64abe205d262bb89efb'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
