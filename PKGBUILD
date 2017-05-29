# Maintainer: Jan Tojnar <jtojnar@gmail.com>
_pkg=patronus-capi
pkgname=patronus
pkgver=0.1.0
pkgrel=1
pkgdesc='Common interface for grammar checkers'
url='https://github.com/patronus-checker/patronus'
makedepends=('cargo')
license=('MIT')
source=("https://github.com/patronus-checker/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('959411b7a9f3bbcf633853f0990f066229670e43acec4a6ac21305c3b581e47a')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_provider_dir=/usr/lib/patronus

build() {
	cd "$pkgname-$pkgver/$_pkg"
	PROVIDER_LOCATION="${_provider_dir}" cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/lib${pkgname}_capi.so" "$pkgdir/usr/lib/lib$pkgname.so"
	install -Dm755 "patronus-capi/extra/patronus.pc" "$pkgdir/usr/lib/pkgconfig/patronus.pc"
	install -Dm755 "patronus-capi/extra/patronus/patronus.h" "$pkgdir/usr/include/patronus/patronus.h"
	install -Dm755 "patronus-provider/extra/patronus-provider.h" "$pkgdir/usr/include/patronus/patronus-provider.h"
}
