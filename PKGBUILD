# Maintainer: Emily Ellis <emily@scgtrp.net>
pkgname=tangara-companion
pkgver=0.5.0
pkgrel=1
pkgdesc="Companion app for Cool Tech Zone Tangara"
depends=('glib2' 'gtk4' 'libadwaita')
makedepends=('cargo' 'meson')
arch=(x86_64)
url="https://github.com/haileys/tangara-companion"
license=('GPL-3.0-only')
source=("https://github.com/haileys/tangara-companion/archive/refs/tags/v${pkgver}.tar.gz" "99-tangara.rules")
sha512sums=('d52fc715cfe5e5d5aa5947f1ef1e63ef945f9a385a4918af41865c52d412bf16ab0c5726ca24a4687fd674c019577fd24ea3273a713df10cebbf97afd1207b5c'
            '3a0488043789818177abcbf61f6455c41b71d33a182a96bbf80c96b805c0c842793cba063fac6d4558907532e6ea90a679f033aa50d3ae2ab3c20d66109d1fa9')
options=('!lto')

prepare() {
	cd "$pkgname-$pkgver"
	meson setup --buildtype=release --prefix="$pkgdir/usr" builddir
}

build() {
	cd "$pkgname-$pkgver"
	meson compile -C builddir
}

package() {
	install -D -m644 99-tangara.rules -t $pkgdir/usr/lib/udev/rules.d/

	cd "$pkgname-$pkgver"
	meson install -C builddir
}
