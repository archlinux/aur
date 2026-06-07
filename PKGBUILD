# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=uni-update
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-distro system updater — one command to update them all"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/uni-update"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'gcc')
optdepends=(
    'flatpak: for --flatpak support'
    'snapd: for --snap support'
    'python-pip: for --pip support'
    'rust: for --cargo support'
    'npm: for --npm support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # заменить на реальный sha256 перед публикацией

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # лицензия
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # man страница (если будет)
    # install -Dm644 doc/uni-update.1 "$pkgdir/usr/share/man/man1/uni-update.1"
}
