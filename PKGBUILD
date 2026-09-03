# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=1.4.3
pkgrel=1
pkgdesc="POSIX shell scripting meets Modern Shell Features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/CJsShell"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/CadenFinley/CJsShell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2df94ac88864c7ca8f005f88c03918deae2e230fb24ac67164b3394694d9e2a')

build() {
    cd "CJsShell-$pkgver"
    export CJSH_GIT_HASH_OVERRIDE=$(git ls-remote https://github.com/CadenFinley/CJsShell.git "refs/tags/v$pkgver" | cut -f1 | cut -c1-8)
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --config Release -j$(nproc)
}

package() {
    cd "CJsShell-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --config Release
}
