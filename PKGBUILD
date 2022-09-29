# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=ajnin
pkgver=0.5
pkgrel=1
pkgdesc='A Beautiful Ninja generator'
arch=('any')
url='https://github.com/b1f6c1c4/ajnin'
license=('AGPL3')
depends=('boost>=1.75.0' 'ninja')
makedepends=('antlr4=4.11.1' 'cmake>=3.17' 'git' 'pandoc')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('883460340093753665c8da8f80102d432624be1f7d13129005567b03daab4924')

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
