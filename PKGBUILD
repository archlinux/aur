# Maintainer: wang1zhen <you@example.com>
pkgname=lyricbridge
pkgver=0.1.0
pkgrel=1
pkgdesc="LyricBridge – Electron + FastAPI lyrics tool"
arch=('x86_64' 'aarch64')
url="https://github.com/wang1zhen/musicbridge"
license=('custom')
depends=(
  'electron'
  'nodejs'
  'python'
  'python-uvicorn'
  'python-fastapi'
  'python-httpx'
  'python-pydantic'
  'python-pydantic-settings'
  'python-cachetools'
  'python-dotenv'
  'python-beautifulsoup4'
  'python-lxml'
  'python-dateutil'
)
makedepends=('git')
provides=('lyricbridge')
conflicts=('lyricbridge-git')
source=(
  "lyricbridge-${pkgver}.tar.gz::https://github.com/wang1zhen/musicbridge/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
  cd "${srcdir}/musicbridge-${pkgver}"

  install -d "${pkgdir}/usr/lib/lyricbridge"
  cp -r lyricbridge/backend "${pkgdir}/usr/lib/lyricbridge/"
  cp -r lyricbridge/frontend "${pkgdir}/usr/lib/lyricbridge/"

  # Launcher
  install -d "${pkgdir}/usr/bin"
  install -m 755 packaging/arch/lyricbridge.sh "${pkgdir}/usr/bin/lyricbridge"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install -m 644 packaging/arch/lyricbridge.desktop "${pkgdir}/usr/share/applications/lyricbridge.desktop"

  # Icon (SVG)
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 644 lyricbridge/frontend/renderer/favicon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lyricbridge.svg"

  # License placeholder (project root README as custom license until formalized)
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

