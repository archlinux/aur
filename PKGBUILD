# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.2.0
pkgrel=2
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp' 'boost')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
optdepends=('kwallet: secure password storage (requires rebuild)' 'kio: better show in folder action (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/attachments/6264b2e6-ed0f-4346-a545-54f337284778")
sha256sums=('057d6c4e4a05f29d35727fc045dbec74ccda78382316bd6e124da0614f314901')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
