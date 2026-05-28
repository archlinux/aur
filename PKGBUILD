# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar-bin
_pkgname=ai-usagebar
pkgver=0.4.2
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
sha256sums_x86_64=('6d6a383911af3c67262314b0179560742b791cce706ccaf08bde68117da7a341')
sha256sums_aarch64=('f4a01abf346ab901efab1cec94619cd0c510b2596cd6f7e709a935e8b1fcb677')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar"
    install -Dm0755 -t "$pkgdir/usr/bin/"                "ai-usagebar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/"    "config.example.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
