# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cpp_ws_backend')
pkgver=0.1.0
pkgrel=1
options=(!debug)
pkgdesc='High-performance FastCGI web backend library in C++'
provides=('libws_backend.so')
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cpp_ws_backend'
license=('LGPL-3.0-only')
makedepends=('cmake' 'gcc')
depends=('glibc' 'fcgi' 'json-c')
optdepends=(
    'sqlite: SQLite database support'
    'mariadb-libs: MySQL and MariaDB database support'
    'postgresql-libs: PostgreSQL database support'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=('e1de1f9da5323baf0880e0284d1f24bf93bd2456782e5d8b52bad4a7baec0a082a9fd3088316b8a4d3279fde90842ae3c440adf059095de61e96fd939fbb6aef')

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DBUILD_DEMOS=OFF -B"build" "$srcdir/$pkgname-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
