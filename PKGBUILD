# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.5
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
optdepends=('kwallet: secure password storage (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz")
sha256sums=('e1a4c88be9f0481d2aa21078faf42fd0e9d66b490b6d8af82827d441cb58df25')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
