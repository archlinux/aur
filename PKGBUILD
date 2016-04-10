# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
pkgname=vimpc-git
pkgver=0.09.0.r100.gd828693
pkgrel=1
pkgdesc="Client for mpd with vi-like key bindings"
arch=('i686' 'x86_64')
url="https://github.com/boysetsfrog/vimpc"
license=('GPL3')
groups=()
depends=('libmpdclient'
         'pcre'
         'ncurses'
         'taglib')
provides=('vimpc')
conflicts=('vimpc')
makedepends=('git'
             'autoconf'
             'automake'
             'boost')
source=("$pkgname"'::git+https://github.com/boysetsfrog/vimpc')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
