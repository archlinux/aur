# Maintainer: Dario Piombo <piombo.dario at gmail dot com>

pkgname=rdm-bin
pkgver=2020.5
pkgrel=1
pkgdesc='Cross-platform open source database management tool for Redis ®'
arch=('x86_64')
url="https://rdm.dev/"
license=('GPL3')
depends=(
  'botan'
  'libssh2'
  'python'
  'qt5-base'
  'qt5-imageformats'
  'qt5-tools'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-charts'
  'qt5-graphicaleffects'
  'qt5-svg')
makedepends=('curl')
conflicts=('redis-desktop-manager-bin' 'redis-desktop-manager')

source=('rdm.desktop')
sha256sums=('5e96ea919336c483fba09fd40839a77f33dc98a0aa5e9de0c7570d9fd888f62e')

prepare() {
  curl -fsSOL https://github.com/pidario/rdm-build/releases/download/${pkgver}/rdm
  curl -fsSOL https://github.com/uglide/RedisDesktopManager/blob/2020/src/resources/images/rdm.png
}

build() {
  echo "skipping build"
}

package() {
  _bindir="$pkgdir/usr/bin"
  _pixdir="$pkgdir/usr/share/pixmaps"
  _appdir="$pkgdir/usr/share/applications"

  mkdir -p "${_bindir}"
  mkdir -p "${_pixdir}"
  mkdir -p "${_appdir}"

  install -Dm755 "$srcdir/rdm" "${_bindir}/rdm"
  install -Dm644 "$srcdir/rdm.png" "${_pixdir}/rdm.png"
  install -Dm644 "$srcdir/rdm.desktop" "${_appdir}/rdm.desktop"
}
