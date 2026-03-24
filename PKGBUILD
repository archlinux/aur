# Maintainer: Uyanide <me@uyani.de>
pkgname=wallreel
pkgver=2.0.1
pkgrel=1
pkgdesc="Choose and set desktop wallpapers with customizable themes and actions"
arch=('x86_64')
url="https://git.uyani.de/Uyanide/WallReel"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'gcc-libs' 'glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://git.uyani.de/Uyanide/WallReel/archive/v${pkgver}.tar.gz")
sha256sums=('3ba31e168f432e9055877836e02f085d4a3d6225c04843d5b9fa576220875be5')

build() {
    cd "wallreel"
    cmake -B build -S . \
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
