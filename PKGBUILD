# Maintainer: willemw <willemw12@gmail.com>

_pkgname=speedometer
pkgname=$_pkgname-git
pkgver=2.8.r8.g9211116
pkgrel=1
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
depends=('python2-urwid')
makedepends=('git' 'python2-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/wardi/speedometer.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" #--optimize=1

  mv "$pkgdir"/usr/bin/speedometer{.py,}
  rm -r "$pkgdir/usr/lib/"
}

