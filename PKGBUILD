# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier-bin
_pkgname=vernier
pkgver=0.1.2
pkgrel=1
pkgdesc="Cross-platform pixel-measurement overlay in Rust (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/vernier"
license=('MIT' 'Apache-2.0')
depends=(
    'fontconfig'
    'freetype2'
    'libglvnd'
    'libxkbcommon'
    'pipewire'
    'wayland'
)
optdepends=(
    'grim: capture held-rect regions via wlr-screencopy'
    'slurp: region selection for the external screenshot shortcut'
    'wl-clipboard: copy screenshots / measurements to the clipboard'
    'libnotify: post-capture notifications'
    'xdg-desktop-portal-hyprland: global hotkey via the GlobalShortcuts portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('425c075d77240d29c6d5f8ea7fa1a2bb12bff7fa6acb7e37e3c0fa9a4937a571')
sha256sums_aarch64=('3e45f5a9c47ca5461582b2275df8844e5f2697bed0cc46f9a25f37bb3af556b5')

package() {
    # The tarball's top-level dir is named after the host arch, so
    # makepkg can pick the right one whether we're packaging on
    # x86_64 or aarch64. $CARCH is set by makepkg for us.
    cd "$srcdir/$_pkgname-$pkgver-$CARCH"

    install -Dm755 vernier "$pkgdir/usr/bin/vernier"

    install -Dm644 vernier.desktop \
        "$pkgdir/usr/share/applications/vernier.desktop"

    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r icons/. "$pkgdir/usr/share/icons/hicolor/"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
