# Maintainer: RickIsGone <riccardotedeschi247@gmail.com>
pkgsubn=bin2cpp
pkgname=bin2cpp-git
pkgver=1.0.5
pkgrel=1
pkgdesc="CLI tool to embed binary files into C++ headers"
arch=('any')
url="https://github.com/rickisgone/bin2cpp"
license=('MIT')
source=("bin2cpp::git+$url.git")
sha256sums=('SKIP')
conflicts=('bin2cpp')
makedepends=('cmake' 'git')

pkgver() {
    cd "$srcdir/$pkgsubn"
    git describe --tags | sed -E 's/^v//;s/-.*//'
}

build() {
    mkdir -p build
    cd build
    cmake ../"$pkgsubn" -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    install -Dm755 build/bin2cpp "$pkgdir/usr/bin/bin2cpp"
}
