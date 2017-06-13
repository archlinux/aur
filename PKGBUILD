# Maintainer: David P. <megver83@parabola.nu>

pkgbase=python-pypump
pkgname=('python-pypump' 'python2-pypump')
pkgver=0.7
pkgrel=3
arch=('any')
license=('GPL3')
pkgdesc="Python pump.io library"
url="https://github.com/xray7224/PyPump"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-dateutil' 'python2-dateutil' 'python-requests' 'python2-requests' 'python-requests-oauthlib' 'python2-requests-oauthlib')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/xray7224/PyPump/archive/v$pkgver.tar.gz")
sha512sums=('3906118f681dd886bd8e3d57a49f66a0bc4236fe526d8137905ea8f7fd9bc9fea61a5646ca6e6617095fab62ab3ce91f2ea7d2c5e150125f399048c2f8831e86')

prepare() {
  mv PyPump-$pkgver pypump-$pkgver
  cp -a pypump-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pypump-$pkgver
  python setup.py build

  cd "$srcdir"/pypump-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pypump-$pkgver
  python setup.py test

  cd "$srcdir"/pypump-$pkgver-py2
  python setup.py test
}

package_python-pypump() {
  depends=('python' 'python-requests' 'python-requests-oauthlib')

  cd pypump-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/python-pypump/LICENSE
}

package_python2-pypump() {
  depends=('python2' 'python2-requests' 'python2-requests-oauthlib')

  cd pypump-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/python2-pypump/LICENSE
}
