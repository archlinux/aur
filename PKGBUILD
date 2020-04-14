# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.4
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
optdepends=('kwallet: secure password storage (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz")
sha256sums=('3b290381eaf15a35d24a58a36c29eee375a4ea77b606124982a063d7ecf98870')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
