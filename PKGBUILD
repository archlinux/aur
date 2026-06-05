# Maintainer: Aridan <https://github.com/actuallyaridan>
pkgname=linux-devmgmt
pkgver=2.0.1
pkgrel=1
pkgdesc="A faithful recreation of the Windows Device Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/actuallyaridan/linux-devmgmt"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/actuallyaridan/linux-devmgmt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('049ad5ed78e677f8fbb1841b10a7a11ede714e3d6690eb7e19ec8cff77a4ef38')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
