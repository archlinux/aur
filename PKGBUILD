# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-unicode
pkgver=0.0.1
pkgrel=2
pkgdesc='Unicode character selector plugin for rofi'
arch=('x86_64')
url='https://github.com/rolv-apneseth/rofi-unicode'
license=('AGPL v3.0')
depends=('rofi')
makedepends=('rust' 'just')
optdepends=(
    'wl-clipboard: Wayland - copy icon to clipboard'
    'xclip: X11 - copy icon to clipboard'
    'wtype: Wayland - insert icon'
    'xdotool: X11 - insert icon'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ce5722c9c5a7905647a7d5f06afc09deee4b1e635f4ac7a4f85c6f5fabab013b52928f15c897714c4d81808869438e5822d990f1e385ec304d45b41b14640f7e')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
