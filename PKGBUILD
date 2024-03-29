# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-ansi
pkgver=0.2.6
pkgrel=1
pkgdesc='Kakoune plugin that renders ANSI escape codes'
arch=('x86_64')
url="https://github.com/eraserhd/kak-ansi"
license=(Unlicense)
depends=(kakoune glibc)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        static_path.patch)
sha256sums=('aabf07770ae6e41fc592b3c6c7ceaf2649c67e6241dc9d9678f6d7ed7bde4444'
            '0f0e2246daed413b1f4de8f08b911f5e88b3c2d936f7b64e84e132ae5b71dc58')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 < ../static_path.patch
}

build() {
	cd "$pkgname-$pkgver"
	cc $CFLAGS -o kak-ansi-filter kak-ansi-filter.c $LDFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.asc
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/ansi.kak
	install -Dm755 -t "$pkgdir/usr/share/kak/rc/addons" kak-ansi-filter
}
