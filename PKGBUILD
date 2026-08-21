# Maintainer: Dany Thinnes <dany@projekt-hirnfrei.de>
# Projekt Hirnfrei - https://www.projekt-hirnfrei.de

pkgname=barecode
pkgver=1.2.0
pkgrel=1
pkgdesc="Schlanker modularer Code-Editor für HTML, PHP, CSS und C++"
arch=('x86_64' 'aarch64')
url="https://www.projekt-hirnfrei.de"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'ninja')
provides=('barecode')
conflicts=('barecode-git')
source=("$pkgname-$pkgver.tar.gz::https://git.projekt-hirnfrei.de/diabolus/BareCode/archive/v$pkgver.tar.gz")
sha256sums=('8d176a02e8bcca2ec4d587e6b4cd1f8edd5c61d9510a412126901c6d1e94976b')

build() {
    cd "barecode"
    cmake -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=ON
    cmake --build build
}

check() {
    :
}

package() {
    cd "barecode"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
