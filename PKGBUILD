# Maintainer: willemw <willemw12@gmail.com>

pkgname=speedometer-git
pkgver=2.8.r35.g031f1f1
pkgrel=1
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
depends=('python-psutil' 'python-urwid')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/wardi/speedometer.git
        remove_pkg_resources.patch)
sha256sums=('SKIP'
            '84dfef8dd2c6bfcc209996d3cebb957933e39188c76bad9e518a8b4a4458e1cf')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch --directory=$pkgname --forward --strip=1 --input="$srcdir/remove_pkg_resources.patch"
  sed -i "s/__version__ = .*/__version__ = 'develop'/" $pkgname/speedometer.py
}

package() {
  install -Dm755 $pkgname/speedometer.py "$pkgdir/usr/bin/speedometer"
}

