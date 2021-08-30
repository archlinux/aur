# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: jgmdev <jgmdev at gmail dot com>

pkgname=lite-xl
pkgver=2.0.1
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64' 'aarch64')
url="https://lite-xl.github.io"
license=('MIT')
depends=('agg' 'lua52' 'reproc' 'sdl2')
makedepends=('meson')
conflicts=("lite")
provides=("lite")
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('40dd2af16db8ff2cee3242fb89ba3d4d3da654b8b5692329f3d09573b441e0c980717a26d3249afa31e87f0adfb318542861af478dfcabb1426fc88e82291946')
b2sums=('e273da452e1300411cb113bb01bb6499b86c97a67ceb9382304faa6a01070a622c96505c4879f8c82bba7f155ab6a21017f56310a477b8c3331133d9b3f3b56b')

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
