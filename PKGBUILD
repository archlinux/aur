# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=augustus
_pkgname=Augustus
pkgver=3.3.3
pkgrel=1
pkgdesc="A eucaryotic gene prediction program"
arch=('i686' 'x86_64')
url="http://augustus.gobics.de/"
license=('custom:Artistic-2.0')
depends=('samtools' 'htslib' 'bamtools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Gaius-Augustus/Augustus/archive/v$pkgver.tar.gz)
sha256sums=('2fc5f9fd2f0c3bba2924df42ffaf55b5c130228cea18efdb3b6dfab9efa8c9f4')
options=(!strip)

prepare() {
  cd $_pkgname-$pkgver
  sed -i "/\/usr\/local\/bin/d" Makefile
  sed -i "/bam2wig/d" auxprogs/Makefile # requires special dir structure of util
}

build() {
  cd $_pkgname-$pkgver
  make SAMTOOLS=/usr/include/bam
}

package() {
  cd $_pkgname-$pkgver
  make INSTALLDIR="$pkgdir" install
  install -Dm644 src/LICENSE.TXT "$pkgdir"/usr/share/licenses/augustus/LICENSE
}
