# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pamqp
_pkgname=pamqp
pkgver=5.0.0
pkgrel=1
pkgdesc="RabbitMQ Focused AMQP low-level library"
arch=("any")
url="https://github.com/gmr/pamqp"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('66b1d8f32a6ef7825973281419a7a6b6469ee48024caae348ca7e2aafa6b02a1894078d95f786ade54eb7ab3260e3dc34d90462a0a2ca45ff7458cc1040b87a0')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
