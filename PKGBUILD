# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# Installs the release's prebuilt binaries. CI updates pkgver and the checksums when upstream releases
# (see .github/workflows/release-packages.yml).

pkgname=dusk-menu-bin
_pkgname=dusk
pkgver=0.1.4
pkgrel=1
pkgdesc='A sleek, customizable logout and power menu for Hyprland, Sway and Niri (prebuilt)'
arch=(x86_64 aarch64)
url='https://github.com/rodneyosodo/dusk'
license=(MIT)
depends=(
  fontconfig
  glibc
  libgcc
  libxkbcommon
  systemd
  vulkan-driver
  vulkan-icd-loader
  wayland
)
optdepends=('libnotify: notifications when an action fails')
provides=(dusk-menu)
conflicts=(dusk-menu dusk-git)
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4b5f8915fecf3f489ce3755c7768b11aa62ee561c3928f242f03a7f96a9f0aa4')
sha256sums_aarch64=('57c7588b9915124c4b07d5375203d77518900b01d3478f93143ceabcbc16d015')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 dusk -t "$pkgdir/usr/bin/"
  install -Dm644 dusk.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 completions/dusk.bash "$pkgdir/usr/share/bash-completion/completions/dusk"
  install -Dm644 completions/_dusk -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 completions/dusk.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 README.md THEMING.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
