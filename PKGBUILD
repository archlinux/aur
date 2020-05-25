# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gromit-mpx-git
_gitname=gromit-mpx
pkgver=1.3.r26.g7c83680
pkgrel=1
pkgdesc="Desktop annotation tool. GTK3 multi-pointer variant of original gromit utility."
arch=('i686' 'x86_64')
url="https://github.com/bk138/gromit-mpx"
license=("GPL2")
depends=('libappindicator-gtk3')
makedepends=('cmake')
provides=('gromit')
conflicts=('gromit')
source=("git+https://github.com/bk138/gromit-mpx.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
}

