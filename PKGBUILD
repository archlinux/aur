# Maintainer: ern <ern8642@gmail.com>
pkgname=logg
pkgver=0.4.0
pkgrel=1
pkgdesc="Easy and fast logging library"
arch=('any')
url="https://github.com/ern123/$pkgname"
license=('LGPL')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ern123/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('819c676be61e3ff04a87171d5ad29a25')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/lib$pkgname.so" "${pkgdir}/usr/lib/lib$pkgname.so"
    mkdir -p "${pkgdir}/usr/include/$pkgname"
    cp src/*.hpp "${pkgdir}/usr/include/$pkgname"
    install -Dm644 "lib/pkgconfig/lib$pkgname.pc" "${pkgdir}/usr/lib/pkgconfig/lib$pkgname.pc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
