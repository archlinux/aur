# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-bin
pkgver=0.3.0 # x-release-please-version
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
b2sums=('72967abe138d99b9b5f9af6ba3b59bfe2009bf79e8c8cad15aeea25a6de9d1af5df91f891c6fda5856e0979d92dc4475c3e21b50a7d89fc75e3ae440e93924d3')

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
