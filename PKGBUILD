# Maintainer: Dany Thinnes <dany@projekt-hirnfrei.de>
# Projekt Hirnfrei - https://www.projekt-hirnfrei.de

pkgname=barecode
pkgver=1.1.0
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
sha256sums=('04b11561920101b0444e5427e50658886d1fc62018426586fe512e405f2dc0e6')  # Nach erstem Download ersetzen: sha256sum barecode-1.1.0.tar.gz

build() {
    cd "BareCode"
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
    cd "BareCode"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
