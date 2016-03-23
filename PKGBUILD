# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=star-cshl
pkgver=2.5.1b
pkgrel=1
pkgdesc="STAR aligns RNA-seq reads to a reference genome using uncompressed suffix arrays"
arch=("i686" "x86_64")
url="https://github.com/alexdobin/STAR"
license=("GPL3")
source=("https://github.com/alexdobin/STAR/archive/${pkgver}.tar.gz")
sha1sums=("54c23f4dbca507b86600271689d7688370bb6166")

build() {
    cd "$srcdir/STAR-${pkgver}/source"

    make STAR
    mv STAR STARshort
    make clean
    make STARlong
}

package() {
    cd "$srcdir/STAR-${pkgver}/source"

    install -Dm755 STARshort "$pkgdir/usr/bin/STAR"
    install -Dm755 STARlong "$pkgdir/usr/bin/STARlong"
    install -Dm644 parametersDefault "$pkgdir/usr/share/doc/star-cshl/parameters"

    cd "$srcdir/STAR-${pkgver}/doc"

    install -Dm644 STARmanual.pdf "$pkgdir/usr/share/doc/star-cshl/STARmanual.pdf"
}
