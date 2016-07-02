# Maintainer: Albert Graef <aggraef at gmail dot com>
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-faust
pkgver=0.10
pkgrel=2
pkgdesc="Run Faust signal processors in Pd"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure' 'pd-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
groups=(pure-complete pure-multimedia)
source=(https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz
	divbyzero-fix.patch)
md5sums=('dda52b6cbcab81ea72f5a392c58791bf'
         '081a8aa9623fab2f703a2205a5cf51cf')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p2 -Ni ../divbyzero-fix.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install 
}
