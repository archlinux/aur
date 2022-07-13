# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=fastq_screen
pkgver=0.15.2
pkgrel=1
pkgdesc="A screening application for high througput sequence data"
arch=('i686' 'x86_64')
url=http://www.bioinformatics.babraham.ac.uk/projects/download.html#"${pkgname//_/}"
license=('GPL3')
provides=('fastq-screen')
depends=('perl')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/StevenWingett/FastQ-Screen/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('3a0a660c4fee383c7be980b3954ab9672bfbfe2373c6f33392acf023be074af86e2356d6f0478a40e1315c3b5428b1b0f17cb01317cf636d4893b093dee9ffc1')

prepare(){
  cd $srcdir/FastQ-Screen-${pkgver}
  sed -i 's|/usr/local|/usr|g' *.example
  sed -i 's|/usr/local|/usr|g' download_genomes/*/*.conf
}
package() {
  cd $srcdir/FastQ-Screen-${pkgver}
  install -Dm755 fastq_screen ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 fastq_screen.conf.example  fastq_screen_summary_template.html \
    -t ${pkgdir}/usr/share/fastq_screen/
  install -Dm644 docs/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  cp -rf download_genomes/* ${pkgdir}/usr/share/fastq_screen/
}
