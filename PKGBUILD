pkgname=whispers-vulkan-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Local-first speech-to-text dictation for Wayland (prebuilt Vulkan release bundle)'
arch=('x86_64')
url='https://github.com/OneNoted/whispers'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'noto-fonts' 'vulkan-icd-loader' 'wl-clipboard')
optdepends=(
  'python: experimental faster-whisper and NeMo runtimes'
  'vulkan-radeon: AMD Radeon Vulkan driver'
  'vulkan-driver: Vulkan driver for other GPUs'
)
provides=('whispers')
conflicts=('whispers' 'whispers-bin' 'whispers-git' 'whispers-cuda-bin' 'whispers-cuda-git' 'whispers-vulkan-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/whispers-vulkan-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('0f444f104ccb9dcdc5ff7e8d3eff210aae8ed69b36f176f54da921318cf40391')

package() {
  local bundle_dir="$srcdir/whispers-vulkan-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$bundle_dir/bin/whispers" \
    "$pkgdir/usr/bin/whispers"
  install -Dm755 "$bundle_dir/bin/whispers-osd" \
    "$pkgdir/usr/bin/whispers-osd"
  install -Dm755 "$bundle_dir/bin/whispers-rewrite-worker" \
    "$pkgdir/usr/bin/whispers-rewrite-worker"

  install -Dm644 "$bundle_dir/share/bash-completion/completions/whispers" \
    "$pkgdir/usr/share/bash-completion/completions/whispers"
  install -Dm644 "$bundle_dir/share/zsh/site-functions/_whispers" \
    "$pkgdir/usr/share/zsh/site-functions/_whispers"
  install -Dm644 "$bundle_dir/share/fish/vendor_completions.d/whispers.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/whispers.fish"

  install -Dm644 "$bundle_dir/share/doc/whispers/README.md" \
    "$pkgdir/usr/share/doc/whispers/README.md"
  install -Dm644 "$bundle_dir/share/doc/whispers/config.example.toml" \
    "$pkgdir/usr/share/doc/whispers/config.example.toml"
  install -Dm644 "$bundle_dir/share/doc/whispers/RELEASE-BUNDLE.txt" \
    "$pkgdir/usr/share/doc/whispers/RELEASE-BUNDLE.txt"

  install -Dm644 "$bundle_dir/share/licenses/whispers/LICENSE" \
    "$pkgdir/usr/share/licenses/whispers/LICENSE"
  install -Dm644 "$bundle_dir/share/licenses/whispers/NOTICE" \
    "$pkgdir/usr/share/licenses/whispers/NOTICE"
}
