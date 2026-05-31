# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

_pkgname=thorium-browser
pkgname=thorium-browser-updated-bin
pkgver=148.0.7778.215
pkgrel=3
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
source=("https://github.com/brauliobo/thorium/releases/download/M${pkgver}-updated/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('5e8ceff97a28618ef13905603b8598be84cf95686aa7bd6be14473be254fbbbc')
noextract=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

package() {
  echo "  -> Extracting Arch package payload..."
  bsdtar -C "$pkgdir" -xf "${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"

  rm -f \
    "$pkgdir/.BUILDINFO" \
    "$pkgdir/.MTREE" \
    "$pkgdir/.PKGINFO"

  ln -sfn thorium-browser "$pkgdir/usr/bin/thorium-browser-stable"
  find "$pkgdir/usr/share/applications" -name '*.desktop' -type f -exec \
    sed -i 's@/usr/bin/thorium-browser-stable@/usr/bin/thorium-browser@g' {} +

  chmod 4755 "$pkgdir/opt/thorium-browser/chrome-sandbox"
  find "$pkgdir" -type d -exec chmod 755 {} +
}
