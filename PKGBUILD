# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=drqueue
pkgver=0.64.4
pkgrel=1
pkgdesc="An Open Source render farm managing software"
arch=('i686' 'x86_64')
url="http://www.drqueue.org/"
license=('GPL')
depends=('python2' 'gtk2' 'tcsh')
makedepends=('scons' 'pkgconfig')
install=drqueue.install
source=(http://www.drqueue.org/files/$pkgname.$pkgver.tgz drqueue.sh SConstruct.patch)
md5sums=('5d60597cc325f40654a5e2c09a557581' 'f74b6b0a3c36a972ba8672cf61e08e22'
         '47bb1942f23390fa593a180196bda157')

build() {
  cd $startdir/src/DrQueue-$pkgver
  patch -p 0 < ../SConstruct.patch

  mkdir -p $startdir/pkg/opt
  scons PREFIX=$startdir/pkg/opt install

  install -D -m755 $startdir/src/drqueue.sh $startdir/pkg/etc/profile.d/drqueue.sh

}
