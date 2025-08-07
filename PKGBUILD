# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-opack2
_pkgname="${pkgname#python-}"
pkgver=0.0.1
pkgrel=4
pkgdesc='Python library for parsing the opack format (fork)'
arch=('any')
url='https://github.com/doronz88/opack2'
license=('GPL-3.0-or-later')
depends=('python' 'python-construct' 'python-arrow')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
conflicts=('python-opack')
provides=('python-opack')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0610be9f1be8638582c699b93186685066c78f30a76bbb1b87683c783d8e560f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
