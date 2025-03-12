# Maintainer: David Adler <d.adler@posteo.de>
_pkgname=jpmidi
pkgname=$_pkgname-git
pkgver=r18.5b29b7d
pkgrel=1
pkgdesc="SMF player for JACK MIDI with transport sync"
arch=('x86_64')
url="https://github.com/jerash/jpmidi"
license=('GPL')
depends=('jack')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://github.com/jerash/jpmidi.git)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname/$_pkgname
    ./autogen.sh 
    ./configure --prefix="/usr" --includedir="/usr/include/jpmidi/"
    make
}

package() {
    cd $_pkgname/$_pkgname
    make DESTDIR="$pkgdir/" install
}

