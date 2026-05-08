# Maintainer: Daniel McGuire <danielmcguire2023@gmail.com>
pkgname=phasor
PACKAGER="Daniel McGuire <danielmcguire2023@gmail.com>"
pkgver=3.3.0
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
source=("https://github.com/DanielLMcGuire/Phasor/archive/refs/tags/3.3.0.tar.gz")
sha256sums=('DE5FD9783FB00E85F7F9392D9672BC2B6692E90ECEDB11148F5D1C65925B7884')

build() {
    cd "$srcdir/Phasor-3.3.0"
    cmake -S . -B build -G Ninja --preset linux-64-rel
    cmake --build build
}

package() {
    cd "$srcdir/Phasor-3.3.0/build"
    cmake --install . --prefix "$pkgdir"
	
	install -Dm644 "$srcdir/Phasor-3.3.0/src/Extensions/unix/phasor.magic" \
        "$pkgdir/usr/share/file/misc/magic/phasor"
}
