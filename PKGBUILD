# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=can-utils-git
_pkgname=can-utils
pkgver=r258.8af831f
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
makedepends=("git" "autoconf" "libtool")
provides=("can-utils")
conflicts=("can-utils")
source=("git+https://github.com/linux-can/can-utils.git")
md5sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install
}
