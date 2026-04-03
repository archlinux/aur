# Maintainer: Uyanide <me@uyani.de>
pkgname=wallreel
pkgver=2.1.1
pkgrel=1
pkgdesc="Choose and set desktop wallpapers with customizable themes and actions"
arch=('x86_64')
url="https://git.uyani.de/Uyanide/WallReel"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'gcc-libs' 'glibc')
makedepends=('cmake')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://git.uyani.de/Uyanide/WallReel/archive/v${pkgver}.tar.gz")
sha256sums=('d077d68927a2aea52b2db95a97518d45e18ad3f83c5781714c8900c9e4828f5a')

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
