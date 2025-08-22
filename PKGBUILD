# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-nerdy
pkgver=0.0.8
pkgrel=2
pkgdesc='Nerd font icon selector plugin for rofi'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-nerdy'
license=('AGPL v3.0')
depends=('rofi')
makedepends=('rust' 'git' 'just')
optdepends=(
    'wl-clipboard: Wayland - copy icon to clipboard'
    'xclip: X11 - copy icon to clipboard'
    'wtype: Wayland - insert icon'
    'xdotool: X11 - insert icon'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7432bdcefe060b767a189198603d119f6eff39833639eff6149598e4615ecca3246b23430f857dd06c95833a62a45110f9d9b77814901897cecd90fe092b6dfc')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit

    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just build
}

package()
{
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just install
}
