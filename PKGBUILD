# Maintainer: wonordel <megorka2014@gmail.com>

pkgname=horaizan-git
pkgver=release.5.g50ed271
pkgrel=1
pkgdesc="Chromium-based browser built with PySide6"
arch=('x86_64')
url="https://github.com/wonordel/Horaizan"
license=('MIT')

depends=(
  'python'
  'pyside6'
  'qt6-webengine'
  'hicolor-icon-theme'
)

makedepends=('git')

optdepends=(
  'xdg-utils: set as default browser via xdg-settings'
)

provides=('horaizan')
conflicts=('horaizan')

install='horaizan.install'

source=(
  "git+https://github.com/wonordel/Horaizan.git"
  'horaizan'
  'horaizan.desktop'
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

options=('!emptydirs')

pkgver() {
  cd "${srcdir}/Horaizan"
  git describe --tags --long --always 2>/dev/null | sed 's/^v//;s/-/./g' || echo "0.r$(git rev-list --count HEAD)"
}

package() {
  cd "${srcdir}/Horaizan"

  install -dm755 "${pkgdir}/usr/lib/horaizan"
  cp -r app "${pkgdir}/usr/lib/horaizan/"

  install -Dm755 "${srcdir}/horaizan" \
    "${pkgdir}/usr/bin/horaizan"

  install -Dm644 "${srcdir}/horaizan.desktop" \
    "${pkgdir}/usr/share/applications/horaizan.desktop"

  install -Dm644 "app/themes/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/horaizan.png"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
