# Maintainer: The Don't Be Evil Company <oss@the-dont-be-evil-company.com>

# INFO:
# This is prefixed with "dbe-" to avoid
# confusion with the already existing "timetrack" gnome package that exist in the AUR.
# The actual application is called "timetrack", and that's what the binary will be named.
pkgname=dbe-timetrack-bin
_pkgname=timetrack
pkgver=5.18.0
pkgrel=1
pkgdesc="Simple, offline-first desktop application to track your time on different projects and tasks."
arch=('x86_64')
url="https://github.com/dont-be-evil-company/timetrack"
license=('MIT')
depends=('nss' 'at-spi2-core' 'libxss' 'gtk3' 'alsa-lib' 'libxtst')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/dont-be-evil-company/timetrack/releases/download/v${pkgver}/timetrack_amd64.deb")
sha256sums=('cf01e7daa7c9cb5bb86cef983ce291a50979678b8f7ad314d6437fe6cedc4a43')

package() {
  if [ -f "data.tar.xz" ]; then
    bsdtar -xf "data.tar.xz" -C "${pkgdir}"
  else
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"
  fi
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/timetrack/timetrack" "${pkgdir}/usr/bin/timetrack"
  if [ -f "${pkgdir}/opt/timetrack/chrome-sandbox" ]; then
    chmod 4755 "${pkgdir}/opt/timetrack/chrome-sandbox"
  fi
}
