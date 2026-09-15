# Maintainer: Youcef NAFA <youcef.nafa@gmail.com>

pkgname=python-vastai
pkgver=1.7.0
pkgrel=1
pkgdesc=" Vast.ai Python and CLI API client ."
arch=('any')
url="https://github.com/vast-ai/vast-cli"
license=('MIT')
depends=('python' 'python-xdg' 'python-argcomplete' 'python-requests' 'python-dateutil' 'python-pytz' 'python-urllib3' 'python-poetry-dynamic-versioning' 'python-gitpython' 'python-toml' 'python-setuptools' 'python-cryptography')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-dynamic-versioning')
optdepends=()
source=("vastai-${pkgver}.tar.gz::https://pypi.io/packages/source/v/vastai/vastai-${pkgver}.tar.gz")
sha256sums=('69ee81680e7c4bd8cd1bbf3e365d71e01b6c33839eda894acf93b387930fb756')

prepare() {
  cd "${srcdir}/vastai-${pkgver}"
  # Remove utils from packages list in pyproject.toml to prevent site-packages conflict
  sed -i 's/\[{ include = "utils" }, { include = "vast.py" }\]/[{ include = "vast.py" }]/' pyproject.toml
}
build() {
  cd "${srcdir}/vastai-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/vastai-${pkgver}"
  python -m installer -d "${pkgdir}" "dist/vastai-${pkgver}-py3-none-any.whl"
}
