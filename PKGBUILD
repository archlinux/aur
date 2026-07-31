# Maintainer: mistweaverco <oss@mistweaverco.com>

# INFO:
# This is prefixed with "mw-" to avoid
# confusion with the already existing "timetrack" gnome package that exist in the AUR.
# The actual application is called "timetrack", and that's what the binary will be named.
pkgname=mw-timetrack-bin
_pkgname=timetrack
pkgver=5.15.0
pkgrel=1
pkgdesc="Simple, offline-first desktop application to track your time on different projects and tasks."
arch=('x86_64')
url="https://github.com/mistweaverco/timetrack"
license=('MIT')
depends=('nss' 'at-spi2-core' 'libxss' 'gtk3' 'alsa-lib' 'libxtst')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/mistweaverco/timetrack/releases/download/v${pkgver}/timetrack_amd64.deb")
sha256sums=('50557beb64bb2f30400c4de4795d6e5f6471a3f0c6b9d03b709eb0b6031276cf')

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
