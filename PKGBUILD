# Maintainer: Uyanide <me@uyani.de>
pkgname=wallreel
pkgver=2.0.0
pkgrel=1
pkgdesc="Choose and set desktop wallpapers with customizable themes and actions"
arch=('x86_64')
url="https://git.uyani.de/Uyanide/WallReel"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://git.uyani.de/Uyanide/WallReel/archive/v${pkgver}.tar.gz")
sha256sums=('2a50722ba02ee0ace717ffc8ee88dec7bd64f94e7e98a204875f96f68ea1187a')

build() {
    cd "wallreel"
    cmake -B build -S . -G Ninja \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd "wallreel"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
