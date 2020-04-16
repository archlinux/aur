# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.4
pkgrel=2
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.3.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
optdepends=('kwallet: secure password storage (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz")
sha256sums=('016475e5ac6a5d2f0ac5181c61f550cd1c9cf69203b435df8bcda8b7aecc410b')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
