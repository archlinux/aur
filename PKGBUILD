# Maintainer: Sapphic Angels <chloe@sapphic.moe>
# Binary package PKGBUILD - installs from pre-built releases
pkgname=caldav-tasks-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A cross-platform CalDAV task management app (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/SapphoSys/caldav-tasks"
license=('Zlib')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!emptydirs')
install=${pkgname}.install
provides=('caldav-tasks')
conflicts=('caldav-tasks')

source_x86_64=(
  "https://github.com/SapphoSys/caldav-tasks/releases/download/app-v${pkgver}/caldav-tasks_${pkgver}_amd64.deb"
  "caldav-tasks.desktop"
)
source_aarch64=(
  "https://github.com/SapphoSys/caldav-tasks/releases/download/app-v${pkgver}/caldav-tasks_${pkgver}_arm64.deb"
  "caldav-tasks.desktop"
)

sha256sums_x86_64=(
  'SKIP'  # Update with actual checksum
  'SKIP'
)
sha256sums_aarch64=(
  'SKIP'  # Update with actual checksum
  'SKIP'
)

package() {
  # Determine which .deb file to extract
  if [ "$CARCH" = "x86_64" ]; then
    local debfile="caldav-tasks_${pkgver}_amd64.deb"
  else
    local debfile="caldav-tasks_${pkgver}_arm64.deb"
  fi

  # Extract the .deb package directly to pkgdir
  bsdtar -xf "$debfile" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/bin/caldav-tasks" 2>/dev/null || true
}
