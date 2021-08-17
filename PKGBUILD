# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>

pkgname=lite-xl
pkgver=2.0.0
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://lite-xl.github.io"
license=('MIT')
depends=('agg' 'lua52' 'reproc' 'sdl2')
makedepends=('meson')
conflicts=("lite")
provides=("lite")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('171bf949f791265943d9f184423677cfda5ca807fa24c6bbd461dfcf1d09f297f32652add4703b8ccdce17e7e6ce0083cf4a1193f99e4e4e49ad11589c51cbfe')
b2sums=('2e0afcee68138277e0e3ca57395071ad1de2de66257d152ba5465f8a930343af00c6f2db5ffe86809fb53917f88c81e35f45316951a67719ec53e87d7906374e')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build --wrap-mode=default
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install --skip-subprojects -C build
    install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
