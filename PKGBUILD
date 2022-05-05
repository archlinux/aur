# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.2.2
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

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/attachments/808a59b3-1759-462d-83f6-81d08dd45377")
sha256sums=('e4fa2174a3ba95159cc3b0bac3f00550c9e0ce971c55334e2662696a4543fc7e')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install
}
