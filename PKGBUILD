# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bowtie2
pkgver=2.5.1
pkgrel=1
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("x86_64")
url="https://bowtie-bio.sourceforge.net/bowtie2"
license=("GPL3")
depends=('zstd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BenLangmead/bowtie2/archive/v${pkgver}.tar.gz")
sha256sums=('3fe00f4f89b5dd85fd9317e2168ec93f30dbb75d7950a08516c767d21eca7c27')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make clean
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr WITH_ZSTD=1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a "${srcdir}/bowtie2-${pkgver}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
}
