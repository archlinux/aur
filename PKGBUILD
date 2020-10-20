# Maintainer: Saulius Lukauskas < luksaulius at gmail com >

pkgname=fastx-toolkit
pkgver=0.0.14
pkgrel=1
pkgdesc="The FASTX-Toolkit is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing."
arch=("any")
url="https://github.com/agordon/fastx_toolkit"
license=('AGPL3')
depends=('perl' 'perl-perlio-gzip' 'perl-gd' 'gnuplot' 'libgtextutils')
source=("https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2")
md5sums=('bf1993c898626bb147de3d6695c20b40')

prepare() {
    cd fastx_toolkit-${pkgver}
    # https://github.com/agordon/fastx_toolkit/pull/22
    sed -i 's/usage();/usage(); break;/g' src/fasta_formatter/fasta_formatter.cpp
}
build() {
		cd fastx_toolkit-${pkgver}
        ./configure --prefix=${pkgdir}/usr
		make
}

package() {
    cd fastx_toolkit-${pkgver}
    make install
    # Not sure why it tries to install these but they're not necessary
    rm -rf "${pkgdir}/usr/share"
}
