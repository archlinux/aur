# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Eric Hugoson
_pkgname=requirements-detector
pkgname=python-requirements-detector
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple Python tool which attempts to find and list the requirements of a Python project"
arch=('any')
url="https://github.com/landscapeio/requirements-detector"
license=('MIT')
depends=('python-astroid' 'python-packaging' 'python-semver' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=(https://github.com/landscapeio/requirements-detector/archive/${pkgver}.tar.gz)
sha512sums=('5c237312bf2d15b6d38bc031e40940dd7c24dcbe46229b16e5164643ae19434084905605bb2d73dc1465338124b3ccf7c778ad6b2a5543a03a4131b6a3d64e51')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
