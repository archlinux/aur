# Maintainer: willemw <willemw12@gmail.com>

pkgname=speedometer-git
pkgver=2.8.r14.g2879e0e
pkgrel=1
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
#depends=('python-urwid')
depends=('python-psutil' 'python-six' 'python-urwid')    # Debian fork
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#source=($pkgname::git+https://github.com/wardi/speedometer.git)
source=($pkgname::git+https://github.com/jova2/speedometer)    # Debian fork
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir/" --optimize=1

  mv "$pkgdir/usr/bin/speedometer"{.py,}
  rm -r "$pkgdir/usr/lib/"
}

