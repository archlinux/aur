# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=huion-switcher
pkgver=0.6.0
pkgrel=1
license=('GPL-2.0-only')
arch=('x86_64')
pkgdesc="A PoC tool to switch Huion tablets into tablet mode"
url="https://github.com/whot/huion-switcher"
depends=('rust')
makedepends=('cargo')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=("https://github.com/whot/huion-switcher/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a60b6fc8e0d2e9931d688346f5e421ea23f95210a20a2c472a4595c8f22f72bf')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build
}

package() {
    install -Dm 755 "${pkgname}-${pkgver}"/target/debug/huion-switcher "$pkgdir"/usr/lib/udev/huion-switcher
    install -Dm 644 "${pkgname}-${pkgver}"/80-huion-switcher.rules "$pkgdir"/etc/udev/rules.d/80-huion-switcher.rules
}
