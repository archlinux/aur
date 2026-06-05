# Maintainer: actuallyaridan <https://github.com/actuallyaridan>
pkgname=linux-devmgmt
pkgver=2.0.4
pkgrel=1
pkgdesc="A faithful recreation of the Windows Device Manager"
arch=('x86_64' 'aarch64')
url="https://github.com/actuallyaridan/linux-devmgmt"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/actuallyaridan/linux-devmgmt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a7784a3cbe95773253beba0621b7c781011d07e71bfbec81ad642856402e308')

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
