# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.2.0
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/rgburke/grv/releases/download/v$pkgver/grv-$pkgver-src.tar.gz")
noextract=()
sha512sums=('dd363bf2ed776716d55db8b2745f84f611ad6ecc007ba995b5bbaef277b153021e400f61041f3e8706e9613438188e3200b351fab1da217633f61ec6521ec204')

build() {
    export GOPATH="$srcdir"
    mkdir -p $GOPATH/src/github.com/rgburke
    rm -rf $GOPATH/src/github.com/rgburke/$pkgname
    mv $srcdir/$pkgname $GOPATH/src/github.com/rgburke

    cd $GOPATH/src/github.com/rgburke/$pkgname
    make build-libgit2

}

package() {
    cd $GOPATH/src/github.com/rgburke/$pkgname
    make install
}

