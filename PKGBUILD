# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-nerdy
pkgver=v0.0.2.r0.g1a222a7
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
source=("$pkgname::git+https://github.com/rolv-apneseth/$pkgname.git")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname" || exit
    git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd "$pkgname" || exit

    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname" || exit

    PKGDIR="$pkgdir" just build
}

package()
{
    cd "$pkgname" || exit

    PKGDIR="$pkgdir" just install
}
