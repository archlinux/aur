# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=wicky-monads
pkgver=0.2
pkgrel=1
pkgdesc='Pain-reliever for build systems'
arch=('any')
url='https://github.com/b1f6c1c4/wicky-monads'
license=('MIT')
makedepends=('cmake>=3.17' 'git' 'pandoc')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a722f5d9a57ed4b2fbbce7d95532e1e72585c123bf480b979a7d01867140ba56')

build() {
    cmake -S "$pkgname-$pkgver" -B "$pkgname-$pkgver/build" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make -C "$pkgname-$pkgver/build"
    make -C "$pkgname-$pkgver/build" manual
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
