# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cpp_ws_backend')
pkgver=0.2.0
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

sha512sums=('5f5b3aa72229b414b2c35d5827f75241c15aef0c1947cf75419c6fae52d85683abb94f66608aac1b846f785bd4f75b8484a2c5374fffc0bdc9290ec7308af41b')

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DBUILD_DEMOS=OFF -B"build" "$srcdir/$pkgname-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
