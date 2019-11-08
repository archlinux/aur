# Maintainer: Frederick Gnodtke <frederick at gnodtke dot de>

pkgname=rust-xtensa-git
pkgver=r95593.b365cff
pkgrel=1
pkgdesc='Rust for ESP32 xtensa.'
arch=('x86_64')
url='https://github.com/MabezDev/rust-xtensa'
license=('GPL')
makedepends=(
    'git'
    'ninja'
    'cmake'
    'llvm-xtensa')
provides=('rust-xtensa')
source=('git://github.com/MabezDev/rust-xtensa')
sha256sums=('SKIP')
install=rust-xtensa-git.install

_gitname='rust-xtensa'

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_gitname 
    ./configure --llvm-root="/opt/llvm-xtensa" --prefix="${pkgdir}/opt/rust-xtensa"
    # Apparently this clones the dependencies.
    python x.py --help || true
    python x.py build

}

package() {
    cd $_gitname
    mkdir -p "${pkgdir}/opt/rust-xtensa"
    python x.py install
}
