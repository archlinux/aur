# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=gsi-sshterm
pkgver=0.91d
pkgrel=2
pkgdesc='Java Grid authentication program by the UK National Grid Service'
arch=('i686' 'x86_64')
url='http://wiki.ngs.ac.uk/index.php?title=GSI-SSHTerm'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f692f19b5cd20cdef0f1245dcbd6b412')

build() {
  cd $srcdir/sshtools
  sh make.sh || return 1
  install -d $pkgdir/opt/ $pkgdir/usr/bin/
  cp -r release/GSI-SSHTerm-$pkgver $pkgdir/opt/$pkgname
  rm -f $pkgdir/opt/$pkgname/bin/*.bat
  echo > $pkgdir/opt/$pkgname/bin/sshterm.log
  chmod 0666 $pkgdir/opt/$pkgname/bin/sshterm.log
  echo -e "#!/bin/sh\ncd /opt/$pkgname/bin\n./sshterm.sh" \
   > $pkgdir/usr/bin/$pkgname
  chmod 0755 $pkgdir/usr/bin/$pkgname
}
