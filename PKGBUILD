# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor
PACKAGER="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=3.1.1
pkgrel=1
pkgdesc="Phasor Programming Language Toolchain"
arch=('x86_64')
url="https://github.com/DanielLMcGuire/Phasor"
license=('0BSD')
makedepends=('gcc' 'cmake' 'ninja')
optdepends=('gcc: For building Phasor Native wrappers.')
conflicts=('phasor-git' 'phasor-dev')
options=(strip !debug)
install=phasor.install
depends=()
source=("https://github.com/DanielLMcGuire/Phasor/archive/refs/tags/3.1.1.tar.gz")
sha256sums=('02f8d2764f1438b2b45d4e58db6d724ccda934d024b1a1ede2e30915cd13c43a')

build() {
    cd "$srcdir/Phasor-3.1.1"
    cmake -S . -B build -G Ninja --preset linux-64-rel
    cmake --build build
}

package() {
    cd "$srcdir/Phasor-3.1.1/build"
    cmake --install . --prefix "$pkgdir"
	
	install -Dm644 "$srcdir/Phasor-3.1.1/src/Extensions/unix/phasor.magic" \
        "$pkgdir/usr/share/file/misc/magic/phasor"
}
