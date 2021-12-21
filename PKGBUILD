# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

_pkgname=diagon
pkgname="${_pkgname}-git"
pkgver=0
pkgrel=1

pkgdesc='cli text diagram generator'
url='https://github.com/ArthurSonzogni/diagon'
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('util-linux-libs')
makedepends=('git' 'cmake' 'boost')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver () {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd "$_pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

build () {
    cd "$_pkgname"/build
    make -j4
}

package () {
    cd "$_pkgname"/build
    make DESTDIR="$pkgdir" PREFIX='/usr' install
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
