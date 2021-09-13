# Maintainer: Térence Clastres <t dot clastres at gmail dot com>
# Maintainer: redtide <redtid3 at gmail dot com>
# Maintainer: jgmdev <jgmdev at gmail dot com>

pkgname=lite-xl
pkgver=2.0.2
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
sha512sums=('c65b459557ddbeaf084e3e28c6a9668e162f7b384e2e20dc855aee2bee25cf9a0f673ccbb99377e808ec2499c734975a07b99521b4a50e0736b5be152424ab3c')
b2sums=('a46289a121b560a239b72acad5874fdfc8d82a75fbccb7a759c098686590ea59baaeb71203fa9f12da3dbdc875bc128a6fefd59e44d35c3067548bb94da1c00d')

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
