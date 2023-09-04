# Maintainer: FederAndInk <unifai at protonmail dot com>
# Contributor: André Apitzsch <andre dot apitzsch at etit dot tu-chemnitz dot de>
pkgname=python-openexr
_name=OpenEXR
pkgver=1.3.9
pkgrel=2
pkgdesc="Python bindings for ILM's OpenEXR image file format"
url='https://github.com/sanguinariojoe/pip-openexr'
arch=('any')
license=('custom')
depends=('openexr' 'python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-${pkgver}.tar.gz
  fix1.patch
)
sha512sums=('cbca74d5ee42e0c03157c583c3b63b65b71e2699e0dc3b478ecbb21e47ac488f2328fa1b1fbb95eff2427afa6b67536b048d161997b081dac5b8d135c15f8f6e'
  '207129f64bdc6216efde14a6a9f939ac2886ef7351789ab6f02846cefd5e36355ad7333a207a8be45ad718a7a885657ce86c9b05182899fd7384d4bdce199560'
)

prepare() {
  cd ${_name}-${pkgver}
  patch -p1 <"$srcdir/fix1.patch"
}

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
