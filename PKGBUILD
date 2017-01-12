# Contributor: 100best

_pkgname=terravox
pkgname=$_pkgname-git
pkgver=v0.0.3.c7f5d21
pkgrel=2
pkgdesc="Simple heightmap Editor for Voxlap5 VXL (512x512 only) (git 
version)"
url="https://github.com/yvt/terravox"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('git')
depends=('qt5-base' 'luajit')
optdepends=('openspades' 'pysnip-git')
provides=('terravox')
conflicts=('terravox')
source=("$pkgname"::'git+https://github.com/yvt/terravox.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo "$(git describe --tags | sed 's/-/+/g').$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd $srcdir/$pkgname
  qmake Terravox.pro
  make
}

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  mkdir -p $pkgdir/usr/bin
  cp LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  cp Terravox $pkgdir/usr/bin  
}
