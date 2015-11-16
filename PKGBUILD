# Maintainer: dhead666 <myfoolishgames@gmail.com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Philippe Cherel <philippe.cherel@mayenne.org>

pkgname=kodi-devel-libcec
_gitname=libcec
pkgver=3.0.1
pkgrel=4
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="http://libcec.pulse-eight.com/"
license=('GPL')
groups=('kodi-devel')
makedepends=('cmake')
depends=('udev' 'lockdev' 'kodi-devel-libplatform' 'libxrandr')
provides=('libcec')
conflicts=('libcec')
source=("$_gitname::git+git://github.com/Pulse-Eight/$_gitname#tag=libcec-$pkgver")
sha256sums=('SKIP')

build() {
    cd "$_gitname"
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
    make
}

package() {
    cd "$_gitname/build"
    make DESTDIR="$pkgdir" install
}
