# Maintainer: Marc Rechté <mrechte@gmail.com>
pkgname=odyssey
pkgver=git
pkgrel=1
arch=('x86_64')
pkgdesc="Advanced multi-threaded PostgreSQL connection pooler and request router"
url="https://github.com/yandex/odyssey"
license=('custom:BSD')
depends=('openssl')
makedepends=('gcc' 'cmake' 'make' 'postgresql')
backup=('etc/odyssey/odyssey.conf')
source=("git+https://github.com/yandex/$pkgname.git"
    odyssey.conf
    tmpfile_odyssey.conf)
md5sums=('SKIP'
    'SKIP'
    'SKIP')
install="$pkgname.install"


prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	make local_build
}

package() {
    install -Dm 0640 odyssey.conf "$pkgdir/etc/odyssey/odyssey.conf"
    install -Dm 0644 tmpfile_odyssey.conf "$pkgdir/etc/tmpfiles.d/odyssey.conf"
	cd "$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 0755 "build/sources/odyssey" "$pkgdir/usr/bin/odyssey"
    install -Dm 0755 scripts/systemd/odyssey.service "$pkgdir/usr/lib/systemd/system/odyssey.service"
}
