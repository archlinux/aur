# Maintainer: Struan Robertson <contact@struanrobertson.co.uk>
pkgname=wlinhibit
pkgver=0.1.2
pkgrel=0
pkgdesc="Simple, stupid idle inhibitor for wayland."
arch=("x86_64")
url="https://github.com/0x5a4/wlinhibit"
license=("MIT")
groups=()
depends=("wayland")
makedepends=("meson" "wayland-protocols")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://github.com/0x5a4/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha512sums=(99f042481d86d534d5f9d40d91a223e8a3dad173120ea96d1c120409600fde97455b7cf25e8f938356f1d17c125d68a210d380e454d2e33fe8aff99d61c676af)

prepare() {
	rm -rf build
        CFLAGS=$CFLAGS LDFLAGS=$LDFLAGS meson setup "${pkgname}-${pkgver}" build --prefix /usr -Dbuildtype=release
}

build() {
        ninja -C build 
}

package() {
        DESTDIR="$pkgdir" ninja -C build install
}
