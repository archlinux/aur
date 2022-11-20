# Maintainer: Santiago Torres-Arias <santiago @ usualplace>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python38-hatchling
pkgver=1.11.1
pkgrel=2
pkgdesc="A modern project, package, and virtual env manager (backend)"
arch=('any')
url="https://github.com/pypa/hatch"
license=('MIT')
depends=('python38' 'python38-tomli' 'python38-packaging' 'python38-pathspec'
        'python38-pluggy' 'python38-editables')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')

_name=${pkgname/python38-/}
source=(
  "${url}/archive/refs/tags/${_name}-v${pkgver}.tar.gz"
)
sha256sums=('614ae622aee0747e0d350e2eedab9bfddb624e03e3f8e5db655af724792eecc1')

build() {
  cd "${srcdir}/hatch-${_name}-v${pkgver}"
  python3.8 -m build --wheel --no-isolation backend
}

package() {
  cd "${srcdir}/hatch-${_name}-v${pkgver}"

  python3.8 -m installer --destdir="$pkgdir" backend/dist/*.whl
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 backend/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
