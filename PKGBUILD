pkgname=python-abi3audit
pkgver=0.0.22
pkgrel=1
pkgdesc="Scans Python wheels for abi3 violations and inconsistencies"
url="https://pypi.org/project/abi3audit/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-abi3info' 'python-kaitaistruct' 'python-packaging' 'python-pefile' 'python-pyelftools' 'python-requests' 'python-requests-cache' 'python-rich')
source=("https://github.com/pypa/abi3audit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb5c87ded0cf7f718c5cfe91f39a583c188caf205cbb8ce03bb3f587fc5b51f1')

prepare () {
  cd "${srcdir}"/abi3audit-${pkgver}
  curl -L https://github.com/pypa/abi3audit/pull/164.patch | patch -p1
}

build () {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/abi3audit-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
