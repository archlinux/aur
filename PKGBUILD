# Maintainer: archlinux.info:tdy

pkgbase=python-chess
pkgname=(python-chess python2-chess)
pkgver=0.16.2
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/$pkgbase
license=(GPL3)
makedepends=(python-setuptools python2-setuptools)
source=(https://github.com/niklasf/$pkgbase/archive/v$pkgver.tar.gz)
sha256sums=(08fc9993f5a781d77ac1c38eed520bef07314ae977427c46f515a416a63f7e64)

prepare() {
  cp -a $pkgbase-$pkgver{,-py2}
}

build() {
  cd $pkgbase-$pkgver
  python setup.py build

  cd ../$pkgbase-$pkgver-py2
  python2 setup.py build
}

package_python-chess() {
  depends=(python)
  conflicts=($pkgname-git)

  cd $pkgbase-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-chess() {
  depends=(python2)
  conflicts=($pkgname-git)

  cd $pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
