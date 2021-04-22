# HackTV git version
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: fsphil
pkgname=hacktv-git
pkgver="779a072"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Analogue TV transmitter for the HackRF"
license=('GPL')
depends=('hackrf' 'ffmpeg')
makedepends=('make' 'git')
provides=('hacktv')
conflicts=('hacktv')
source=("git://github.com/fsphil/hacktv")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/hacktv"
    git describe --tags --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/hacktv"
    make
}

package() {
    cd "$srcdir/hacktv"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/local"
    ln -s "$pkgdir/usr/bin" "$pkgdir/usr/local/bin"
    make PREFIX="$pkgdir" install
    rm -r "$pkgdir/usr/local"
}
