# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sauliusl <luksaulius[at]gmail[dotcom]>

pkgname=sra-tools-bin
_pkgname=sra-tools
pkgver=2.10.5
pkgrel=1
pkgdesc="The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives"
arch=('x86_64')
provides=('sra-tools' 'sratoolkit')
url="http://www.ncbi.nlm.nih.gov/books/NBK158900/"
license=('custom')
groups=('sequence_analysis')
depends=('libxml2' 'gcc-libs-multilib' 'fuse' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${pkgver//_/-}/sratoolkit.${pkgver//_/-}-ubuntu64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/ncbi/sra-tools/master/LICENSE")
sha256sums=('c72f72c9a93f50dc19f77af9b3bd9f128c3e8f74fd9462f19fcfd00d896d7fc3'
            '122edf134e4230505179e9a1891ac3fea334f1b67d767933e9e86dc5b49adfdb')

package() {
  pkgverdash=${pkgver//_/-}
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${_pkgname}
  install -d ${pkgdir}/usr/share/doc/${_pkgname}/example/perl
  install -dm644 ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.$pkgverdash-ubuntu64/schema ${pkgdir}/usr/share/${_pkgname}/
  cp -ar $srcdir/sratoolkit.$pkgverdash-ubuntu64/bin/* ${pkgdir}/usr/bin/
  install -Dm755 $srcdir/sratoolkit.$pkgverdash-ubuntu64/example/perl/* ${pkgdir}/usr/share/doc/${_pkgname}/example/perl/
  install -Dm644 $srcdir/sratoolkit.$pkgverdash-ubuntu64/README* ${pkgdir}/usr/share/doc/${_pkgname}
  install -Dm644 $srcdir/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}