# Maintainer: Youcef NAFA <youcef.nafa@gmail.com>

pkgname=python-vastai
pkgver=1.5.6
pkgrel=1
pkgdesc=" Vast.ai Python and CLI API client ."
arch=('any')
url="https://github.com/vast-ai/vast-cli"
license=('MIT')
depends=('python' 'python-xdg' 'python-argcomplete' 'python-requests' 'python-dateutil' 'python-pytz' 'python-urllib3' 'python-poetry-dynamic-versioning' 'python-gitpython' 'python-toml' 'python-setuptools' 'python-cryptography')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-dynamic-versioning')
optdepends=()
source=("vastai-${pkgver}.tar.gz::https://pypi.io/packages/source/v/vastai/vastai-${pkgver}.tar.gz")
sha256sums=('370a005d4510305b78109e065f03372eb6f8a4caf217da85a5008cbb4ae08396')

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
