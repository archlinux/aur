# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.2.1
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools' 'boost')
optdepends=('kwallet: secure password storage (requires rebuild)'
            'kconfig: system themes support (requires rebuild)'
            'kconfigwidgets: system themes support (requires rebuild)'
            'kio: better show in folder action (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/attachments/0d1b2782-4ac0-4760-86e1-9985b165f95a")
sha256sums=('c00dad1e441601acabb5200dc394f53abfc9876f3902a7dd4ad2fee3232ee84d')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install
}
