# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rofi-unicode
pkgver=0.0.2
pkgrel=1
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
sha512sums=('d7b26e850918cb9b44a57e1e06e465dbe1197947a3d3ea652912cc9d5ff30241aa686873c0634347df06fcf17253bad53dc0e48cefa577787412c5c17009c4a7')
options=(!debug !lto)

prepare() {
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just build
}

package() {
    cd "$pkgname-$pkgver" || exit

    PKGDIR="$pkgdir" just install
}
