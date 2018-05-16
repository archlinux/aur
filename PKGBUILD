# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.1.3
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
sha512sums=('5b579a8ddbe3e261301e22b7f1e9384ed2dbb2fa1c3355619da00bde2e81520822bf796828b5c56711074b9579aacd1178d661df787ef9636404c8fbada1f5aa')

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

