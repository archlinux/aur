# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=wicky-monads
pkgver=0.1
pkgrel=1
pkgdesc='Pain-reliever for build systems'
arch=('any')
url='https://github.com/b1f6c1c4/wicky-monads'
license=('MIT')
makedepends=('cmake>=3.17' 'git')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ec51e64e0ed022347e447a535679c26f1a54f4836eefa87254500676448312fc')

build() {
    cmake -S "$pkgname-$pkgver" -B "$pkgname-$pkgver/build" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make -C "$pkgname-$pkgver/build"
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install

    install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
