# Maintainer: Leonid Selivanov <bravebug@gmail.com>
pkgname=python-wgmesh
_name=wgmesh
pkgver=1.0.1
pkgrel=1
pkgdesc="WireGuard mesh topology generator"
arch=("any")
url="https://github.com/bravebug/wgmesh"
license=("MIT")
depends=(
  "python"
  "python-yaml"
  "python-jinja"
  "wireguard-tools"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/bravebug/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6bf9944fcd0191d08d9709c0c4435dd7daf13933e70e3eb947bd35073c69bbe')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 completion/wgmesh.bash     "$pkgdir/usr/share/bash-completion/completions/wgmesh"
}
