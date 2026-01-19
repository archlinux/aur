# 
pkgname=sdn
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple directory navigator"
arch=('x86_64')
url="https://git.janouch.name/p/sdn/"
license=('custom:0BSD')
depends=('ncurses' 'acl')
makedepends=('cmake' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://git.janouch.name/p/sdn/archive/v${pkgver}.tar.gz")
sha256sums=('a50b0ccab6b1f18fa330fda8c0484e6ed6af22711ca681ea7fa0363fa79cf25a')

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

