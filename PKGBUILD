# HackTV git version
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: fsphil
pkgname=hacktv-git
pkgver=r286.d7d37f4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Analogue TV transmitter for the HackRF"
license=('GPL')
depends=('hackrf' 'ffmpeg' 'soapysdr')
makedepends=('make' 'git')
provides=('hacktv')
conflicts=('hacktv')
source=("git+https://github.com/fsphil/hacktv")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/hacktv"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
