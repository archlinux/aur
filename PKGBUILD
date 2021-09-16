# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=python-endpoints
pkgver=4.3.0
pkgrel=1
pkgdesc="Lightweight REST API framework"
arch=('any')
url="https://github.com/jaymon/endpoints"
license=('MIT')
depends=('python-decorator' 'python-datatypes')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/e/endpoints/endpoints-$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('c29088ebe60944e2049f25ac424d9fe1ce3b59033e73c6819ce380977a780c86'
            'a2d153ce864bada83622dd4ff8b7f7c83a04ba84c7cc8cf83707e4a420f27e23')

prepare() {
  ## setup.py installs tests directory; remove it
  patch -p1 -d "endpoints-$pkgver" < 001-setup.py.patch
}

build() {
  cd "endpoints-$pkgver"
  python setup.py build
}

package() {
  cd "endpoints-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
