# 
pkgname=sdn
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple directory navigator"
arch=('x86_64')
url="https://git.janouch.name/p/sdn/"
license=('custom:0BSD')
depends=('ncurses' 'acl')
makedepends=('cmake' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://git.janouch.name/p/sdn/archive/v1.0.0.tar.gz")
sha256sums=('f1121627a865b20cb4bf944e3f112f9c0412374829fed634ca4b677b5c0979f7')

build() {
    rm -rf "$pkgname"/build
    mkdir "$pkgname"/build
    cd "$pkgname"/build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None
    make
}

package() {
    cd "$pkgname"/build
    make DESTDIR="$pkgdir" install
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

