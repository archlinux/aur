# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=keyboard_latency
pkgver=1.0
pkgrel=2
pkgdesc="Daemon for resolving keyboard lag issues on Dell XPS 13 laptops"
arch=('i686' 'x86_64')
url="https://gitlab.com/craftyguy/keyboard_latency"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'make')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('e535aa28565438a066939fbe3942a20958254acd243374f79e9e355f7c501276252b2ed8ad9f6955ab5bfbc039bdd170babdb91d88b90d9e43d6f59bf32c68e2')

build() {
        cd "$pkgname-$pkgver"
        make all
}

package() {
        cd "$pkgname-$pkgver"
        install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/keyboard_latency.service" "${pkgdir}/usr/lib/systemd/system/keyboard_latency.service"
}

