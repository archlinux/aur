# Maintainer: ern <ern8642@gmail.com>
pkgname=logg
pkgver=0.4.1
pkgrel=1
pkgdesc="Easy and fast logging library"
arch=('any')
url="https://github.com/ecsuarez/$pkgname"
license=('LGPL')
makedepends=('cmake' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ecsuarez/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d0aca477157e7de327a58d9dc79bfe16')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
    cd ../docs
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/lib$pkgname.so" "${pkgdir}/usr/lib/lib$pkgname.so"
    mkdir -p "${pkgdir}/usr/include/$pkgname"
    cp src/*.hpp "${pkgdir}/usr/include/$pkgname"
    install -Dm644 "lib/pkgconfig/lib$pkgname.pc" "${pkgdir}/usr/lib/pkgconfig/lib$pkgname.pc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    cp -r docs/doc/html "${pkgdir}/usr/share/doc/$pkgname/"
    cp -r examples "${pkgdir}/usr/share/doc/$pkgname"
}
