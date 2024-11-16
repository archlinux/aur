#  Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyyaml-include
pkgver=2.2
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
  '59f3cd22b55526a08ccac24c5d2ad6120df0caf5788259a7969d8ade22f048f8'
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
