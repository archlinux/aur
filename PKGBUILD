# Maintainer: Murdi <murdialthaf848@gmail.com>

pkgname=animaru
pkgver=0.1.0
pkgrel=4
pkgdesc="A GTK4 GUI for watching and downloading anime"
arch=('any')
url="https://github.com/murdialthaf/animaru"
license=('GPL3')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'mpv'
  'python-beautifulsoup4'
  'python-dataclasses-json'
  'python-levenshtein'
  'python-pycountry'
  'python-pycryptodomex'
  'python-rapidfuzz'
  'python-requests'
  'python-urllib3'
  'python-mpv'
  'python-pyee'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-pip'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/murdialthaf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Bundle anipy-api and its dependencies not available in Arch repos
  pip install --root="${pkgdir}" --prefix=/usr --no-deps anipy-api m3u8 python-ffmpeg simpleeval

  install -Dm644 data/animaru.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 data/icons/animaru.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
