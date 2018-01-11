# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
_pkgname=jpmidi
pkgname=$_pkgname-git
pkgver=r14.8425151
pkgrel=1
pkgdesc="SMF player for JACK MIDI with transport sync"
arch=('x86_64')
url="https://github.com/jerash/jpmidi"
license=('GPL')
depends=('jack')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/jerash/jpmidi.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname/$_pkgname"
    ./autogen.sh 
    ./configure --prefix="/usr"
    make
}

package() {
    cd "$srcdir/$_pkgname/$_pkgname"
    make DESTDIR="$pkgdir/" install
}

