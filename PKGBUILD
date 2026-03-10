pkgname=accessgram-git
_pkgname=accessgram
pkgver=r23.0f86022
pkgrel=2
pkgdesc='An accessible Telegram client for Linux'
arch=('any')
url='https://github.com/destructatron/AccessGram'
license=('MIT')
depends=(
  'python'
  'python-telethon'
  'python-gobject'
  'gtk4'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
)
optdepends=(
  'python-cryptg: optional Telegram crypto acceleration'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "git+${url}.git"
  'accessgram.desktop'
)
sha256sums=(
  'SKIP'
  '892b7ea65e4dc5b8727c151b967736f16a0309ea16b086f083f8cee6e75e1a05'
)

pkgver() {
  cd "${srcdir}/AccessGram"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/AccessGram"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/AccessGram"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/accessgram.desktop" \
    "${pkgdir}/usr/share/applications/accessgram.desktop"
}
