# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=ajnin
pkgver=0.4
pkgrel=1
pkgdesc='A Beautiful Ninja generator'
arch=('any')
url='https://github.com/b1f6c1c4/ajnin'
license=('AGPL3')
depends=('boost>=1.75.0' 'ninja')
makedepends=('antlr4=4.10.1' 'cmake>=3.17' 'git' 'pandoc')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0403710c98f4fb42264e48b433486ff8b246f659736dc681d7e6a0baa68e8605')

build() {
    cmake -S "$pkgname-$pkgver" -B "$pkgname-$pkgver/build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make -C "$pkgname-$pkgver/build"
    make -C "$pkgname-$pkgver/build" manual
}

check() {
    make -C "$pkgname-$pkgver/build" test
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
