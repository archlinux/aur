# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar-bin
_pkgname=ai-usagebar
pkgver=1.5.2
pkgrel=1
pkgdesc="Omarchy/Waybar widgets + TUI for AI plan usage (prebuilt binary)"
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
sha256sums_x86_64=('dad011afbbd5df2d24b39eae61fd5bfa2c22225a522938396cc3e394d2373ba2')
sha256sums_aarch64=('ae9fe2d37f7ae805f4c0c188d8a47be7c8ebc5f6a94cf82a5f4feb6abe2510b6')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar"
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/"    "config.example.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
