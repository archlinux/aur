# Maintainer: LaT-SKY <miprota@163.com>
pkgname=oddity-bin
pkgver=0.1.0alpha.2
pkgrel=1
pkgdesc="Native Linux launcher for Neverness To Everness"
arch=('x86_64')
url="https://github.com/LaT-SKY/Oddity"
license=('GPL-3.0-or-later')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'librsvg'
  'libsecret'
  'libayatana-appindicator'
  'hicolor-icon-theme'
  'desktop-file-utils'
  'xdg-utils'
)
optdepends=('umu-launcher: run the game through Proton')
provides=('oddity')
conflicts=('oddity')
options=('!strip' '!debug')
install=oddity-bin.install
_upstream=0.1.0-alpha.2
source_x86_64=("oddity-0.1.0-alpha.2-linux-x86_64.tar.gz::https://github.com/LaT-SKY/Oddity/releases/download/oddity-v0.1.0-alpha.2/oddity-0.1.0-alpha.2-linux-x86_64.tar.gz")
sha256sums_x86_64=('4d7a7dc942c192fb933b2b4734893d696ce6425bcdd4f2dfc687f09b9117686f')

package() {
  local dir="$srcdir/oddity-${_upstream}-linux-x86_64"
  install -Dm755 "$dir/oddity" "$pkgdir/usr/bin/oddity"
  install -Dm755 "$dir/nte-cli" "$pkgdir/usr/bin/nte-cli"
  install -Dm644 "$dir/oddity.desktop" "$pkgdir/usr/share/applications/oddity.desktop"
  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "$dir/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/oddity.png"
  done
  install -Dm644 "$dir/LICENSE" "$pkgdir/usr/share/licenses/oddity/LICENSE"
  install -Dm644 "$dir/THIRD_PARTY.md" "$pkgdir/usr/share/licenses/oddity/THIRD_PARTY.md"
  install -Dm644 "$dir/README.md" "$pkgdir/usr/share/doc/oddity/README.md"
}
