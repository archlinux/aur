# Maintainer: Jon Kinney <jon@headway.io>
pkgname=hyprcorrect-bin
_pkgname=hyprcorrect
pkgver=0.1.0
pkgrel=1
pkgdesc="Keyboard-driven desktop spelling and typo corrector (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/hyprcorrect"
license=('MIT' 'Apache-2.0')
options=(!debug)
depends=(
    'fontconfig'
    'freetype2'
    'hyprland'
    'libglvnd'
    'libsecret'
    'libxkbcommon'
    'wayland'
    'wtype'
)
optdepends=(
    'wl-clipboard: enables the clipboard / selection fallback when the keystroke buffer is empty'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('7ec8ea0785c0a9bb904a55abe82e90893ef2d658477f75517e5676bfebd30718')
sha256sums_aarch64=('19beb809aacf481fc9fe409b17325a1279b923a9a27ff96357014c6601251fdf')

package() {
    # The release tarball is named after the host arch — $CARCH is set
    # by makepkg so we pick the right one whether we're packaging on
    # x86_64 or aarch64.
    cd "$srcdir/$_pkgname-$pkgver-$CARCH"

    install -Dm755 hyprcorrect "$pkgdir/usr/bin/hyprcorrect"
    install -Dm644 hyprcorrect.desktop "$pkgdir/usr/share/applications/hyprcorrect.desktop"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
