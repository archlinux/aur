# Maintainer: marmis
# Contributor: envolution

pkgname=python-funk
pkgdesc='A mocking framework for Python, influenced by JMock'
pkgver=0.5.0
pkgrel=3
url='https://github.com/mwilliamson/funk'
arch=(any)
license=('BSD-2-Clause')
checkdepends=('python-nose')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=('python' 'python-precisely')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('07f4089e1ed46f0c86a666a3c4b4254fd631f748e4c49efe473ac049088f4418f01ffa6443df476b9ba9aa915c10c393d672af192363ab461b115deb6c33918b')

build() {
  cd "funk-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "funk-${pkgver}"

  : python -m nose test/
}

package() {
  cd "funk-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
