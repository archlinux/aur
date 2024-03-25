# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

# TODO Try isolated build in clean chroot

pkgname=simsapa
pkgver='0.5.0_alpha.1'  # No dashes in version string
_projver='0.5.0-alpha.1'
pkgdesc='A sutta reader and Pali dictionary application'
pkgrel=1
arch=(any)
url='https://simsapa.github.io'
license=('GPL3')
depends=(
  'python>=3.11'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-sqlalchemy-git>=2.0.22'  # TODO Should provide non-git pkg
  'python-sqlalchemy-utils'
  'python-yaml'
  'python-alembic'
  'python-requests'
  'python-platformdirs'
  'python-pillow'
  'python-semver'
  'python-lxml'
  'python-dotenv'
  'python-pyperclip'
  'python-networkx'
  'python-bokeh'
  'python-scipy'
  'python-typer'
  'python-click'
  'python-tomlkit'
  'python-beautifulsoup4'
  'python-markupsafe'
  'python-flask'
  'python-flask-cors'
  'python-markdown'
  'python-psutil'
  'python-blessed'
  'python-roman'
  'python-chardet'
  'python-urllib3'
  'python-datetime'
  'python-deepmerge'
  'python-charset-normalizer'
  'python-ebooklib'
  'python-openai'
  'python-tiktoken'
  'python-pytz')
# TODO Make pkgs
#python-tantivy = { git = "https://github.com/simsapa/tantivy-py.git", branch = "simsapa" }
#'aksharamukha'
#'python-epub-meta'
#'python-idzip'

optdepends=()
makedepends=(
  'pyinstaller-hooks-contrib'
  'python-build'
  'python-installer'
  'python-wheel')
source=("https://github.com/simsapa/${pkgname}/archive/refs/tags/v${_projver}.tar.gz")
sha256sums=('23853b0fe927b46913b8f34540a0c3ca59aa7893dbccf6408a56ef8588b949ea')

build() {
  cd "${srcdir}/${pkgname}-${_projver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${_projver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
