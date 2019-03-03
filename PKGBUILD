pkgname=bemenu
pkgver=0.1.0
pkgrel=1

pkgdesc='Dynamic menu library and client program inspired by dmenu with support for wayland compositors.'
url='https://github.com/Cloudef/bemenu'
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL3')
depends=('pango')
makedepends=('cmake' 'libxkbcommon' 'libxinerama' 'wayland')
optdepends=('wayland: For the wayland backend.'
            'libxkbcommon: For the wayland backend.'
            'libxinerama: For the x11 backend.'
            'ncurses: For the curses backend.')

conflicts=('bemenu-git')

source=("https://github.com/Cloudef/bemenu/archive/${pkgver}.tar.gz")

sha256sums=('fddc08be9f04efea221841ccc481ed7ae27a6f28438c1f9871939fe71b22559e')

build() {
    cd bemenu-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

check() {
    cd bemenu-${pkgver}
    make test
}

package() {
    cd bemenu-${pkgver}
    make DESTDIR="$pkgdir" install
}
