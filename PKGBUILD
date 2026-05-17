# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-bin
pkgver=1.0.0 # x-release-please-version
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
b2sums=('1c0e21f59caedde77e5e63a4e4f2d55cb44e8d4ffd3eca9281f4d95a3d8621189050bb8690a8543847479403f3d37fb3a759d216486ac0594e1e19a390440c1a')

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
