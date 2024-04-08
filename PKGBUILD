# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=simsapa
pkgver='0.5.2_alpha.1'
pkgrel=1
_projver="${pkgver/_/-}"
pkgdesc='A sutta reader and Pali dictionary application'
arch=(any)
url='https://simsapa.github.io'
license=('GPL-3.0-only')
depends=(
  'python-alembic'
  'python-beautifulsoup4'
  'python-blessed'
  'python-bokeh'
  'python-deepmerge'
  'python-dotenv'
  'python-ebooklib'
  'python-epub_meta'
  'python-flask'
  'python-flask-cors'
  'python-idzip'
  'python-markdown'
  'python-networkx'
  'python-openai'
  'python-platformdirs'
  'python-psutil'
  'python-pyperclip'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-requests'
  'python-semver'
  'python-sqlalchemy-git>=2.0.22'  # TODO Should depends on non-git pkg
  'python-sqlalchemy-utils'
  'python-tantivy-py-simsapa'
  'python-tiktoken'
  'python-tomlkit'
  'python-typer'
  'python-urllib3'
  'python>=3.11'
)

optdepends=('calibre: export to MOBI')
makedepends=(
  'pyinstaller-hooks-contrib'
  'python-build'
  'python-installer'
  'python-wheel')
_src_url="${pkgname}-${pkgver}.tar.gz::"
_src_url="${_src_url}https://github.com/simsapa/${pkgname}/archive/refs/tags/"
_src_url="${_src_url}v${_projver}.tar.gz"
source=("$_src_url" "io.github.${pkgname}.desktop")
sha256sums=(
  '82fb27c3bfcc00e8dbdceefcd71463e1f37326cba2110a4fb1f87ca95bb534b5'
  '362eb4118ca2d48b5764ab836f83291be877773f23406220a56ef7d7b88efa0c'
)

build() {
  cd "${srcdir}/${pkgname}-${_projver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${_projver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install \
    -Dm644 simsapa/assets/icons/appicons/simsapa.png \
    -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install \
    -Dm644 "${srcdir}/io.github.simsapa.desktop" \
    -t "$pkgdir/usr/share/applications/"
}
