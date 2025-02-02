# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Contributor: Kyle Meyer <kyle@kyleam.com>

_name=palettable
pkgname=python-palettable
pkgver=3.3.3
pkgrel=4
pkgdesc="Color palettes for Python"
arch=('any')
url="https://pypi.org/project/palettable"
license=('MIT')
depends=('python' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=("python-pytest")
replaces=('python-brewer2mpl')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jiffyclub/palettable/d267e4aa8f746ab800d4998e670d60eca13f32cd/license.txt")
sha256sums=('094dd7d9a5fc1cca4854773e5c1fc6a315b33bd5b3a8f47064928facaf0490a8'
            '06982353629cfa6b7b339fa4cfccd6eca5a4434d5caefb7c32e68baa41a1be7c')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPATH="." pytest test
}

package() {
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
