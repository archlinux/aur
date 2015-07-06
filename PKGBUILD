# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=dialign
pkgver=2.2.1
pkgrel=3
pkgdesc="Multiple sequence alignment program"
arch=('i686' 'x86_64')
url="http://dialign.gobics.de"
license=('LGPL2.1')
depends=('glibc')
source=($url/download/dialign_package.tgz
        $pkgname.patch)
md5sums=('3ea891efbaac8572f9ff1dc7f1d3c5f8'
         '11d16969daf2280e63c0bb333810fa93')

prepare() {
  cd dialign_package/src
  patch dialign.c < $srcdir/$pkgname.patch
}

build() {
  cd dialign_package/src
  make
}

package() {
  cd dialign_package
  install -Dm755 src/dialign2-2 $pkgdir/usr/bin/$pkgname
  install -d $pkgdir/usr/share/$pkgname
  install -m644 -t $pkgdir/usr/share/$pkgname dialign2_dir/*
  install -Dm644 USER_GUIDE $pkgdir/usr/share/doc/$pkgname/USER_GUIDE
}