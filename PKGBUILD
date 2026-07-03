# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=1.3.0
pkgrel=1
pkgdesc="POSIX shell scripting meets Modern Shell Features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/CJsShell"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/CadenFinley/CJsShell/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82c9819e554ba72a56ef89999749cc893785ad6005620f53913d586f133ff0ad')

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
