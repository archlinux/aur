# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# PKGBUILD based on the one from https://aur.archlinux.org/packages/lite

pkgname=lite-xl
_pkgname=lite
pkgver=1.16.12
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('agg' 'lua52' 'sdl2')
makedepends=('meson')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('33303fb91e2c10b10f9f16656f032591d65d3bc22fe9b2ab1d622cd97b79015d61c7a5ef28b4320e6f7ad8cec73f8855351765f4a4984c29a516ba80edb72491')
b2sums=('044f24d792c98e0a5d01cec4d1c61b224eb0b7b45bac034df9d6415b5a4bd2a7ea0d6e4f48adf0f6cfe06da402b6c9884624ad92f997f27ebbe1ce332d8b99d0')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" meson install -C build

    install -Dm 644 "dev-utils/$_pkgname.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm 644 "dev-utils/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
