# Maintainer: lcaohoanq

pkgname=irys-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Quiet 30-30-30 eye-break reminder that lives in the system tray"
arch=('x86_64')
url="https://github.com/the-khiem7/IRYS-desktop"
license=('MIT')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
)
optdepends=(
  'waybar: StatusNotifier tray host for Hyprland and other wlroots compositors'
  'gnome-shell-extension-appindicator: tray icon support under GNOME Shell'
)
provides=("irys=${pkgver}")
conflicts=('irys')
options=('!strip' '!debug')
source=(
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
source_x86_64=(
  "IRYS_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/IRYS_${pkgver}_amd64.deb"
)
noextract=("IRYS_${pkgver}_amd64.deb")
sha256sums=(
  'e6f45c852b887823997f4438bf52f989d02ec6060d8dd2185473ec76764f83c8'
)
sha256sums_x86_64=(
  '76f5fcae5c37e71f2058ebf5204179e2b754a3911aa15ca488eeb446807b34e7'
)

package() {
  bsdtar -xOf "$srcdir/IRYS_${pkgver}_amd64.deb" data.tar.gz |
    bsdtar -xf - -C "$pkgdir"

  install -Dm644 "$srcdir/LICENSE-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
