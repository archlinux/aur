# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=mafft
pkgver=7.309
pkgrel=1
pkgdesc="Multiple alignment program for amino acid or nucleotide sequences"
arch=('i686' 'x86_64')
url="http://mafft.cbrc.jp/alignment/software"
license=('custom')
depends=('ruby')
options=('!makeflags')
source=($url/$pkgname-$pkgver-with-extensions-src.tgz)
md5sums=('a73a28f9d77b3cac0427302a658b2726')

build() {
  cd $pkgname-$pkgver-with-extensions/core
  make clean
  make PREFIX=/usr LIBDIR=/usr/lib/mafft

  cd ../extensions
  make clean
  make PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package() {
  cd $pkgname-$pkgver-with-extensions/core
  make PREFIX=$pkgdir/usr LIBDIR=$pkgdir/usr/lib/mafft install

  cd ../extensions
  make PREFIX=$pkgdir/usr LIBDIR=$pkgdir/usr/lib/mafft install

  install -d $pkgdir/usr/share/licenses/mafft/
  install -m644 ../license* $pkgdir/usr/share/licenses/mafft/

  rm $pkgdir/usr/lib/mafft/*.1

  ln -sf /usr/lib/mafft/mafft-profile $pkgdir/usr/bin
  ln -sf /usr/lib/mafft/mafft-distance $pkgdir/usr/bin
}
