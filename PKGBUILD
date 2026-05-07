# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-bin
pkgver=0.1.8 # x-release-please-version
pkgrel=1
pkgdesc="Tauri overlay daemon for agent-driven workflows on Hyprland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/hyprpilot/hyprpilot"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'gtk-layer-shell'
  'libappindicator-gtk3'
)
provides=('hyprpilot')
conflicts=('hyprpilot-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/hyprpilot/hyprpilot/releases/download/v$pkgver/hyprpilot-v$pkgver-x86_64-unknown-linux-gnu.tar.zst")
# updpkgsums fills these in on every release-please bump (the AUR
# publish workflow runs `updpkgsums: true` so the deployed PKGBUILD
# always carries real checksums against the freshly-uploaded
# tarball). Local-build path: run `updpkgsums` manually after a
# pkgver edit.
b2sums=('a91603743aa55c0a8c33295367688d3897b023fb98e8bb8045c8485659a0efd86da21582ad5199f817fd2151972f2c4a9502307239dae8368bd2e63b4082baa8')

package() {
  cd "$srcdir/hyprpilot"
  install -Dm755 hyprpilot "$pkgdir/usr/bin/hyprpilot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 hyprpilot.desktop "$pkgdir/usr/share/applications/hyprpilot.desktop"
  install -Dm644 hyprpilot.service "$pkgdir/usr/lib/systemd/user/hyprpilot.service"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprpilot.png"
  done
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
