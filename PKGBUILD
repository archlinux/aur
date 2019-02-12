pkgname=("python-pluginloader" "python2-pluginloader")
pkgbase=python-pluginloader
pkgver=1.0.0
pkgrel=1
pkgdesc="A library to allow an easy way to load plugins"
url="https://github.com/magmax/python-pluginloader"
arch=('any')
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/magmax/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9cdf4ffc0b7fdfad89ed22da2b54c247e4e0124f4f6ae3bfe9382fc3da2e17b0')

prepare() {
  cd "$srcdir"
  cp -a $pkgbase-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py build
}

package_python-pluginloader() {
  depends=("python")
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-pluginloader() {
  depends=("python2")
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
