# Maintainer: Jon Kinney <jon@headway.io>
pkgname=hyprcorrect-bin
_pkgname=hyprcorrect
pkgver=0.1.3
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
sha256sums_x86_64=('5152151099d63c60c424564c26301ef1ff7a3ae275e6729b7c9c4998226ff907')
sha256sums_aarch64=('988a35300acf81bedfbe2d3ea1a291b09197df9719918d5cd85deded085feb18')

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
