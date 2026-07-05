# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar-bin
_pkgname=ai-usagebar
pkgver=0.10.0
pkgrel=1
pkgdesc="Waybar widget + TUI for AI plan usage (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/ai-usagebar"
license=('MIT')
depends=('gcc-libs')
optdepends=(
    'waybar: status bar that hosts the widget'
    'libnotify: desktop notifications on hard auth failures'
)
provides=("$_pkgname=$pkgver")
# Conflict with both the source variant AND its auto-generated debug split.
# Without listing `ai-usagebar-debug` explicitly, swapping from source → bin
# leaves an orphan debug package that fights us over /usr/lib/debug paths.
conflicts=("$_pkgname" "$_pkgname-debug")
# The release tarball ships a pre-stripped binary, so re-stripping is a
# no-op and the auto-generated -debug split would be empty AND would
# collide with the source variant's `ai-usagebar-debug` package.
options=('!strip' '!debug')

# Per-arch sources — pacman picks the matching one for the host arch.
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_x86_64=('f71f948b33b560e86ff0cb2cc9702be9f4d02570b314c9cea43002b5a7721419')
sha256sums_aarch64=('a1001f17bb6b3e67e4029a8f2142fc88d8555877be3d1bc99d458623deab6243')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar"
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/"    "config.example.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
