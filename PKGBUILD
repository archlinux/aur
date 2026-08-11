# Maintainer: Cenk Kılıç <cenk1cenk2cenk3@gmail.com>
pkgname=hyprpilot-bin
pkgver=3.10.0 # x-release-please-version
pkgrel=1
pkgdesc="Config-driven CLI launcher that execs the vendor's native agent CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/hyprpilot/hyprpilot"
license=('MIT')
provides=('hyprpilot')
conflicts=('hyprpilot-git')
source=("$pkgname-$pkgver.tar.zst::https://github.com/hyprpilot/hyprpilot/releases/download/v$pkgver/hyprpilot-v$pkgver-x86_64-unknown-linux-gnu.tar.zst")
# updpkgsums fills these in on every release-please bump (the AUR
# publish workflow runs `updpkgsums: true` so the deployed PKGBUILD
# always carries real checksums against the freshly-uploaded
# tarball). Local-build path: run `updpkgsums` manually after a
# pkgver edit.
b2sums=('6cc8551b8b14fcac494d8d49938f6948eccb2fbc845695453e1d9a273c441ffb199b02e88096dae275abe83aafd4d8d691e170f7bb26e27f7342d58b495e8c54')

package() {
  cd "$srcdir/hyprpilot"
  install -Dm755 hyprpilot "$pkgdir/usr/bin/hyprpilot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 hyprpilot.desktop "$pkgdir/usr/share/applications/hyprpilot.desktop"
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprpilot.png"
  done
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
