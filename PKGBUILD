# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Eric Hugoson
_pkgname=requirements-detector
pkgname=python-requirements-detector
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple Python tool which attempts to find and list the requirements of a Python project"
arch=('any')
url="https://github.com/landscapeio/requirements-detector"
license=('MIT')
depends=('python-astroid')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=(https://github.com/landscapeio/requirements-detector/archive/${pkgver}.tar.gz)
sha512sums=('dcef6b49a50bd48af9eb6c69d4cda00c5b11a748b03d58833aef7f0646e6fe7223315c9a0cd9d87058376dc21563b0d48dc3ef66a3095d113f74434371af540b')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
