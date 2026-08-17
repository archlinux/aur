
# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=minibwa
pkgver=0.7
pkgrel=1
pkgdesc="Successor of bwa-mem for short-read alignment"
arch=('x86_64' 'aarch64')
url="https://github.com/lh3/minibwa"
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=(
)
provides=()
conflicts=()
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=('ea5f974a03fbd5f5dd3c7d4323d6e63917c440d26767bf649d008cebb96c7701'
)

build() {
    cd ${pkgname}-${pkgver}
    make -j
}

check() {
    cd ${pkgname}-${pkgver}
    ./minibwa index test/chrM-human.fa.gz chrM-human
    ./minibwa map chrM-human test/chrM-read_?.fa.gz > aln.sam
}

package() {
    cd ${pkgname}-${pkgver}
    install -D minibwa ${pkgdir}/usr/bin/minibwa
    gzip -c minibwa.1 | install -Dm644 /dev/stdin ${pkgdir}/usr/share/man/man1/minibwa.1.gz
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
