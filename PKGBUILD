# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-nerdy
pkgver=0.0.9
pkgrel=1
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
sha512sums=('2573ae613f2b416acb55ebef224d6f410b6fb7c67fc6d4a4ed544e38955a1e2edd5a67b0dd2c3fbe400bb39829c81fcc7a6fe71d8d960364e16d714486329083')
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
