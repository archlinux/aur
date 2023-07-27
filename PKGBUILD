# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# NOTE Please make sure you have at least 80Gb of free space.
pkgname=ytsaurus
pkgver=0.0.0
pkgrel=4
pkgdesc="A scalable and fault-tolerant open-source big data platform."
arch=('x86_64')
url='https://ytsaurus.tech/'
license=('Apache')
groups=('yandex')
depends=()
makedepends=(
    'cmake'
    'clang-14'
    'lld-14'
    'lldb-14'
    'conan1'
    'python'
    'python-pip'
    'ninja'
    'libidn'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytsaurus/ytsaurus/archive/refs/heads/main.tar.gz")
sha256sums=('dca3af5d65bee2c4cef10cc18094b6f82d95b2a528f26382f9bf77862ee3b849')

build() {
	cd "$pkgname-main"
    cmake -S . -B build/release -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_TOOLCHAIN_FILE=clang.toolchain \
    cmake --build build
}

package() {
	cd "$pkgname-main"
    cmake --install build/release --prefix $pkgdir/usr
}
