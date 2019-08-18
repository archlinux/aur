# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=2
pkgrel=1
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('python' 'bash')
conflicts=('hardened-malloc-git')
source=("https://github.com/GrapheneOS/$pkgname/archive/$pkgver.tar.gz"
        'preload.sh')
sha256sums=('4b6e19374457b90f8cdfdc2e3590795355f43adb5fb29f0ba786c562e826547f'
            'e6dbce7ac1d689fafbc94ffb17d8c4ae5271dd3580421828d35aac2c067b652d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 --target-directory="$pkgdir/usr/lib" libhardened_malloc.so
  install -Dm755 "$srcdir/preload.sh" "$pkgdir/usr/bin/hardened_malloc_preload"
  install -Dm755 calculate_waste.py "$pkgdir/usr/bin/hardened_malloc_calculate_waste.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
