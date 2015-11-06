# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=gromit-mpx-git
_gitname=gromit-mpx
pkgver=1.1.r33.g98e92c2
pkgrel=1
pkgdesc="Desktop annotation tool. GTK3 multi-pointer variant of original gromit utility."
arch=('i686' 'x86_64')
url="https://github.com/bk138/gromit-mpx"
license=("custom:Public Domain")
depends=('gtk3')
provides=('gromit')
conflicts=('gromit')
source=("git://github.com/bk138/gromit-mpx.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    autoreconf --install
    ./configure --sysconfdir=/etc --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
}
