# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=ytsaurus
pkgver=0.0.0
pkgrel=1
pkgdesc="A scalable and fault-tolerant open-source big data platform."
arch=('x86_64')
url='https://ytsaurus.tech/'
license=('Yandex')
groups=('yandex')
depends=()
makedepends=(
    'cmake'
    'clang'
    'lld'
    'lldb'
    'conan'
    'git'
    'python'
    'python-pip'
    'ninja'
    'libidn'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytsaurus/ytsaurus/archive/refs/heads/main.tar.gz")
sha256sums=('dca3af5d65bee2c4cef10cc18094b6f82d95b2a528f26382f9bf77862ee3b849')

build() {
	cd "$pkgname-$pkgver"
    cmake -S . -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_TOOLCHAIN_FILE=ytsaurus/clang.toolchain
    ninja
}

package() {
	cd "$pkgname-$pkgver"
    ninja
}
