# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=3.11.6
pkgrel=1
pkgdesc="POSIX shell scripting meets Modern Shell Features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/CJsShell"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CadenFinley/CJsShell/archive/$pkgver.tar.gz")
sha256sums=('f07831009a1693091768431524169e57d4fdeb5b2205ebcec9830d39b4fac3ab')

build() {
    cd "CJsShell-$pkgver"
    export CJSH_GIT_HASH_OVERRIDE=$(git ls-remote https://github.com/CadenFinley/CJsShell.git "refs/tags/$pkgver" | cut -f1 | cut -c1-8)
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --config Release -j$(nproc)
}

package() {
    cd "CJsShell-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --config Release
}
