# Maintainer: Dany Thinnes <dany@projekt-hirnfrei.de>
# Projekt Hirnfrei - https://www.projekt-hirnfrei.de

pkgname=barecode
pkgver=1.3.0
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
sha256sums=('47a5a64936e1c2e61164cf09623dee5f2f5dd1592b2887efca773eac1e9eabfd')  # Nach erstem Download ersetzen: sha256sum barecode-1.1.0.tar.gz

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
