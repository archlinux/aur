# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgbase=python-hid
pkgname=(python-hid python2-hid)
_name=${pkgbase#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="Python hidapi bindings in ctypes (aka pyhidapi)"
arch=(any)
url="https://github.com/apmorton/pyhidapi"
license=(MIT)
makedepends=(python-setuptools python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('d02bce9b9eee3fbece8b9f4cafd34973')

prepare() {
  cd "$srcdir"
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python setup.py build

  cd "$srcdir"/$_name-$pkgver-py2
  python2 setup.py build
}

package_python-hid() {
  depends=(python)
  conflicts=(python-hidapi)

  cd "$srcdir"/$_name-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-hid() {
  depends=(python2)
  conflicts=(python2-hidapi)

  cd "$srcdir"/$_name-$pkgver-py2

  export PYTHONHASHSEED=0
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
