# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=1
pkgrel=1
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('python' 'bash')
conflicts=('hardened-malloc-git')
source=("https://github.com/GrapheneOS/$pkgname/archive/$pkgver.tar.gz"
        'preload.sh')
sha256sums=('4a0d496199af491c92a964729e61b11a844c5699082e4158632e71935d5a73fc'
            'e6dbce7ac1d689fafbc94ffb17d8c4ae5271dd3580421828d35aac2c067b652d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 --target-directory="$pkgdir/usr/lib" libhardened_malloc.so
	install -Dm755 "$srcdir/preload.sh" "$pkgdir/usr/bin/hardened-malloc-preload"
	install -Dm755 calculate_waste.py "$pkgdir/usr/bin/hardened-malloc-calculate-waste.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
