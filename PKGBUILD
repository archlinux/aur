# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pamqp
_pkgname=pamqp
pkgver=4.0.1
pkgrel=1
pkgdesc="RabbitMQ Focused AMQP low-level library"
arch=("any")
url="https://github.com/gmr/pamqp"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('829c6a021b57ed0019ad3adab286c4047a0a15be19f7f25c62c926afdaaf1ca3026986671ff270904ec493ed7121293bfaa1a7e7e7ecf2a79483268c73dd6d41')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
