# Maintainer: CPT-Dawn <ping@cptdawn.dev>
pkgname=vellum-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Featherweight wallpaper manager for Wayland: a tiny daemon, CLI and TUI (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Vellum"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=('vellum')
conflicts=('vellum' 'vellum-git')
options=('!debug' '!strip')
_version=2.0.2
_tag=v2.0.2
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/vellum-$_version-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/vellum-$_version-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7a129eb31ee0e6f97cfde3c83034a631621728ef64eee403b7025a59acb20f64')
sha256sums_aarch64=('799448bcab6a680917729f3274e9a69f2c6065d6b59a2f2863278d24aabceb23')

package() {
  cd "vellum-$_version-$CARCH-unknown-linux-gnu"
  install -Dm755 vellum vellumd -t "$pkgdir/usr/bin"
  install -Dm644 vellumd.service -t "$pkgdir/usr/lib/systemd/user"

  install -Dm644 completions/vellum.bash \
    "$pkgdir/usr/share/bash-completion/completions/vellum"
  install -Dm644 completions/_vellum -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/vellum.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
