# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

_pkgname=thorium-browser
pkgname=thorium-browser-updated-bin
pkgver=148.0.7778.215
pkgrel=1
pkgdesc="Chromium fork focused on high performance and security, packaged from updated binaries"
arch=('x86_64')
url="https://github.com/brauliobo/thorium"
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'libcups'
  'libnotify'
  'libxcomposite'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
makedepends=('libarchive')
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
)
provides=('thorium-browser')
conflicts=('thorium-browser' 'thorium-browser-bin' 'thorium-browser-updated')
options=('!emptydirs' '!strip' '!debug')
install="${pkgname}.install"
source=(
  "thorium::git+https://github.com/brauliobo/thorium.git#commit=02714fcb63171e9623d3383704fd18928e381071"
  "https://github.com/brauliobo/thorium/releases/download/M${pkgver}-updated/${_pkgname}-${pkgver}-3-x86_64.pkg.tar.zst"
)
sha256sums=('SKIP'
            '801b462b64bf05bafa81e6b11af65010db694ba1f14020f68b37141d7fc18d00')
noextract=("${_pkgname}-${pkgver}-3-x86_64.pkg.tar.zst")

package() {
  echo "  -> Extracting Arch package payload..."
  bsdtar -C "$pkgdir" -xf "${_pkgname}-${pkgver}-3-x86_64.pkg.tar.zst"

  rm -f \
    "$pkgdir/.BUILDINFO" \
    "$pkgdir/.MTREE" \
    "$pkgdir/.PKGINFO"

  chmod 4755 "$pkgdir/opt/thorium-browser/chrome-sandbox"
  find "$pkgdir" -type d -exec chmod 755 {} +
}
