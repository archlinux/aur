# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=3.11.5
pkgrel=1
pkgdesc="POSIX shell scripting meets Modern Shell Features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/CJsShell"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CadenFinley/CJsShell/archive/$pkgver.tar.gz")
sha256sums=('72250b714743a00a7057f49f182b8120d384ba2e0e2c8b495817b38d6a3fc50f')

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
