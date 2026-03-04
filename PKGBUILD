# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=cclip
pkgver=3.3.1
pkgrel=1
pkgdesc="Clipboard manager for wayland"
arch=('x86_64')
url="https://github.com/heather7283/cclip"
license=('GPL-3.0-or-later AND MIT') # thirdparty/pollen is under MIT
depends=('glibc' 'libsqlite3.so' 'libwayland-client.so' 'libxxhash.so')
makedepends=('git' 'meson' 'wayland') # 'wayland' is required for `wayland-scanner`
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('efd175353ca105ea4c0733457308576110eda8f4124ff0fc3640ee3ab6cc251ea85c0d449498ec6cd4ae1462860da821327f3d457b9ce659cadd6bd68b0d0133')

build() {
	arch-meson --buildtype=release "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	cd "$pkgname-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 thirdparty/pollen/LICENSE "$pkgdir/usr/share/licenses/$pkgname/thirdparty/pollen/LICENSE"
}
