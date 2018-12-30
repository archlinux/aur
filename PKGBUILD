# Maintainer: allencch <allencch at hotmail dot com>
pkgname=rmotifgen
pkgver=3.0
pkgrel=4
pkgdesc="Random motif sequence generator for genomic sequences"
arch=('i686' 'x86_64')
url="http://bioinformatics.louisville.edu/rMotifGen.html"
license=('GPL')
depends=()
source=("http://bioinformatics.louisville.edu/localresources/software/rMotifGen${pkgver}.tar.gz"
        "source.patch")
md5sums=('b8b43a6cfd3c8ade4eee3306c9661eda'
         'b3317f939d7a21c84dd3acc48319ce49')

build() {
    cd "${srcdir}/rMotifGen_v${pkgver}"
    sed -i -e 's|PAM1\.prob|/opt/rMotifGen/PAM1.prob|' SubstitutionMatrices.cpp
    patch -p1 -u -l < ../source.patch
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/rMotifGen"
    cd "${srcdir}/rMotifGen_v${pkgver}"
    install -m755 rMotifGen "${pkgdir}/usr/bin"
    cp PAM1.prob README *.PSSM AAinput.dat DNAinput.dat "${pkgdir}/opt/rMotifGen"
}
