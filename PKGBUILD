# Maintainer: kaptoxic <kaptoxic [at] yahoo [dot] com>
# Contributor: Caleb Reach <caleb.reach@codphilosophy.com>

pkgname=biblabel
pkgver=0.07
pkgrel=2
pkgdesc="Generate standardized BibTeX citation labels"
arch=('i686' 'x86_64')
license=(GPL3)
url="http://ftp.math.utah.edu/pub//$pkgname/"
source=(http://ftp.math.utah.edu/pub//$pkgname/$pkgname-$pkgver.tar.gz)
makedepends=('gcc')
depends=('bash' 'bibclean')
md5sums=('e43a6ba9d92cfb0bf74dd6937f0d7d70')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,share/man/man1,share/lib}  
  make AWK='"gawk -c"' prefix=$pkgdir/usr MANDIR="${pkgdir}/usr/share/man/man1" CP='cp -p' install
  #make AWK='"gawk -c"' prefix=$pkgdir/usr CP='cp -p' install
  make AWK='"gawk -c"' LIBDIR=/usr/share/lib prefix=$pkgdir/usr MANDIR="${pkgdir}/usr/share/man"  install-exe-biblabel
  unlink $pkgdir/usr/bin/biblabel
  unlink $pkgdir/usr/bin/citesub
  mv $pkgdir/usr/bin/biblabel-$pkgver $pkgdir/usr/bin/biblabel
  mv $pkgdir/usr/bin/citesub-$pkgver $pkgdir/usr/bin/citesub
}
