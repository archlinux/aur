# HackTV git version
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: fsphil
pkgname=hacktv-git
pkgver=r375.8a5dff8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Analogue TV transmitter for the HackRF"
license=('GPL-3.0-or-later')
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
    make -C src/
}

package() {
    cd "$srcdir/hacktv"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/local"
    ln -s "$pkgdir/usr/bin" "$pkgdir/usr/local/bin"
    make -C src/ PREFIX="$pkgdir" install
    rm -r "$pkgdir/usr/local"
}
