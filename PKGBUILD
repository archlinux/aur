# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=1.5.4
pkgrel=1
pkgdesc="POSIX shell scripting meets Modern Shell Features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/cjsh"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/CadenFinley/cjsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e280768fdae3cfcba4f082d42c375accb2b4e8b148654171ad82a2bda0d27186')

build() {
    cd "cjsh-$pkgver"
    export CJSH_GIT_HASH_OVERRIDE=$(git ls-remote https://github.com/CadenFinley/cjsh.git "refs/tags/v$pkgver" | cut -f1 | cut -c1-8)
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --config Release -j$(nproc)
}

package() {
    cd "cjsh-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --config Release
}
