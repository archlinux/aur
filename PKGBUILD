# Maintainer: Oleh Sheremeta <your-email@example.com>
pkgname=lumen-lang-git
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc="A lightweight, stack-based scripting language with a custom compiler, bytecode format, and virtual machine written in C++20"
arch=('x86_64')
url="https://github.com/spikest3r/LumenLang"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'make')
provides=('lumen')
conflicts=('lumen-lang')
source=("$pkgname::git+https://github.com/spikest3r/LumenLang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "1.0.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    cd "$pkgname"
    install -Dm755 build/lumen "$pkgdir/usr/bin/lumen"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
