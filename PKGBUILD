# Maintainer: Goodarz <1831847+a-goodarzi@users.noreply.github.com>

pkgname=coverup-pdf
pkgver=0.4.2
pkgrel=1
pkgdesc='Tool for redacting PDF files and images'
arch=('any')
url='https://github.com/digidigital/CoverUP'
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
  'python-appdirs'
  'python-fpdf2'
  'python-freesimplegui'
  'python-pillow'
  'python-pypdfium2'
  'tk'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/digidigital/CoverUP/archive/refs/tags/${pkgver}.tar.gz"
  'coverup.desktop'
)
sha256sums=(
  '9971d5ca4e6d7eedf627509c9f9f11274bd5dd1ca86fab4a835213f33432ce99'
  '0af4a552be004092539ac2c2a361d64732c3e7138d68869f36128d6047cd3054'
)

prepare() {
  cd "CoverUP-${pkgver}"
  sed -i 's/setuptools>=61.0,<80/setuptools>=61.0/' pyproject.toml
}

build() {
  cd "CoverUP-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "CoverUP-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CoverUP.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/coverup.svg"
  install -Dm644 "${srcdir}/coverup.desktop" "${pkgdir}/usr/share/applications/coverup.desktop"
}
