# Contributor: Hexchain Tong <i@hexchain.org>

_pkgname=pony
pkgname=("python-$_pkgname" "python2-$_pkgname")
pkgver=0.7.3
pkgrel=1
pkgdesc='Pony Object-Relational Mapper'
arch=('any')
url="http://pypi.python.org/pypi/$_pkgname"
license=('AGPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ba725df726e9835abf50665a26a1f1c6')


prepare() {
  cp -r "$_pkgname-$pkgver" "python2-$_pkgname-$pkgver"
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build

  cd ../python2-$_pkgname-$pkgver
  python2 setup.py build
}

package_python-pony() {
  depends=('python')

  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pony() {
  depends=('python2')

  cd python2-$_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
