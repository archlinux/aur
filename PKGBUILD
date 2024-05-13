#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
pkgver=2.1
pkgrel=1
pkgdesc='An extending constructor of PyYAML: include YAML files into YAML document'
arch=('any')
url="https://github.com/tanbro/pyyaml-include"
license=('GPL-3.0-or-later')
depends=('python-fsspec' 'python-toml' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-aiohttp' 'python-requests')
source=(
  "git+https://github.com/tanbro/pyyaml-include#tag=v$pkgver"
)
sha256sums=(
  '958414250495deda2f0144a5e8156664f564efe7a6973fc0cfcfa59e1aa1aede'
)

build() {
  cd pyyaml-include
  python -m build --wheel --no-isolation
}

check() {
  cd pyyaml-include
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd pyyaml-include
  python -m installer --destdir="$pkgdir" dist/*.whl
}
