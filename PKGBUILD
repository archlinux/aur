# Maintainer: Porta <portalmaster137@gmail.com>
pkgname='include_gardener'
pkgver=r294.1980a9d
pkgrel=1
pkgdesc="A tool to generate a graphviz graph of your C/C++ project's include structure."
arch=("x86_64")
url="https://github.com/portalmaster137/include_gardener"
license=("MIT")
depends=("boost" "graphviz" "python-pip")
makedepends=("git" "cmake" "base")
source=('include_gardener::git+https://github.com/portalmaster137/include_gardener.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir" install
}