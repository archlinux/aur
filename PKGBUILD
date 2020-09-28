# Maintainer: Chuan Liu <liuchuan@liuchuan.org>

pkgname=spdlog_setup
pkgver=0.3.0
pkgrel=1
pkgdesc='A library to initialize spdlog via file configuration for convenience'
arch=('x86_64')
url='https://github.com/guangie88/spdlog_setup'
license=('MIT')
depends=('spdlog' 'cpptoml')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/guangie88/spdlog_setup/archive/v$pkgver.tar.gz")
sha256sums=('d0cfa7d306ff65596e36be42e23c231a1b8f84e8fe339b94c15fca58c67516e3')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DSPDLOG_SETUP_CPPTOML_EXTERNAL=ON \
        -DSPDLOG_SETUP_INCLUDE_UNIT_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
