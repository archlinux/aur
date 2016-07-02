# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pdl2ork-faust
_pkgname=pd-faust
pkgver=0.10
pkgrel=2
pkgdesc="Run Faust signal processors in Pd, Pd-L2Ork version"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd-l2ork' 'pure'  'pdl2ork-pure' 'pure-faust' 'pure-audio' 'pure-midi' 'pure-stldict')
makedepends=('faust')
license=('LGPL3')
source=(https://bitbucket.org/purelang/pure-lang/downloads/$_pkgname-$pkgver.tar.gz
	divbyzero-fix.patch)
md5sums=('dda52b6cbcab81ea72f5a392c58791bf'
         '081a8aa9623fab2f703a2205a5cf51cf')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p2 -Ni ../divbyzero-fix.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make PD=pd-l2ork DESTDIR=$pkgdir prefix=/usr install 
}
