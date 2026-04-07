# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pamqp
_pkgname=pamqp
pkgver=4.0.0
pkgrel=2
pkgdesc="RabbitMQ Focused AMQP low-level library"
arch=("any")
url="https://github.com/gmr/pamqp"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('42eb86dd12deff2cf94db1788e29c390e289fd39aea2aa45061e711bfdd5bae556015e587314b1caafed96acc3864ede768f30bf2560920f7cfbd60174e4962a')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
