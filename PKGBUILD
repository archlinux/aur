# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=blast+
pkgver=2.3.0
pkgrel=1
pkgdesc="finds regions of similarity between biological sequences"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('lzo2' 'pcre' 'python')
makedepends=('cpio')
conflicts=('blast' 'blast+-bin' 'ncbi-blast' 'ncbi-blast+' 'cddlib' 'proj')
provides=('blast' 'blast+-bin' 'ncbi-blast' 'ncbi-blast+')
replaces=('ncbi-blast')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-src.tar.gz")
md5sums=('0f252f0edf6c92e18012622fc93083b0')

build() {
  cd $srcdir/ncbi-blast-$pkgver+-src/c++

  ./configure \
    --prefix=/usr \
    --with-dll \
    --with-mt \
    --without-gnutls

  make
}

package() {
  cd $srcdir/ncbi-blast-$pkgver+-src/c++

  make prefix=$pkgdir/usr install

  chmod +x $pkgdir/usr/lib/*.so

  install -d $pkgdir/usr/share/licenses/$pkgname

  echo 'public domain' > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
