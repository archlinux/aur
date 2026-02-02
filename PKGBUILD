# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor
packager="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=2.2.0
pkgrel=1
pkgdesc="Phasor Programming Language Toolchain"
arch=('x86_64')
url="https://github.com/DanielLMcGuire/Phasor"
license=('0BSD')
makedepends=('gcc' 'cmake' 'ninja')
conflicts=('phasor-git' 'phasor-dev')
options=(strip !debug)
depends=()
source=("https://github.com/DanielLMcGuire/Phasor/archive/refs/tags/2.2.0.tar.gz")
sha256sums=('3AB4C4A1DAC0EDD4582678737CBD7B891E438EF074015D1695141A4EE9B7E065')

build() {
    cd "$srcdir/Phasor-2.2.0"
    cmake -S . -B build -G Ninja --preset linux-64-rel
    cmake --build build --config Release
}

package() {
    cd "$srcdir/Phasor-2.2.0/build"
    cmake --install . --prefix "$pkgdir"
    for section in 1 3 5 7; do
        src="$srcdir/Phasor-2.2.0/docs/man/man$section"
        dest="$pkgdir/usr/share/man/man$section"
        mkdir -p "$dest"
        for file in "$src"/*."$section"; do
            [ -f "$file" ] && install -Dm644 "$file" "$dest"/
        done
    done
}
