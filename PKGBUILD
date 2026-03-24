# Maintainer: Uyanide <me@uyani.de>
pkgname=wallreel
pkgver=2.0.0
pkgrel=2
pkgdesc="Choose and set desktop wallpapers with customizable themes and actions"
arch=('x86_64')
url="https://git.uyani.de/Uyanide/WallReel"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://git.uyani.de/Uyanide/WallReel/archive/v2.0.0-2.tar.gz")
sha256sums=('080d24c2e677194adab994bf107a7ac9ec77a598c0cc5be06743f076a9d2f0a8')

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
