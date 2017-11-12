# Maintainer: Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
_realpkgname=STYMulator
pkgname=stymulator
pkgver=0.21a
pkgrel=1
pkgdesc="STYMulator is an Open Source (GPL License) player which plays music files in the YM chiptune format."
arch=('x86_64')
url="http://atariarea.krap.pl/stymulator/"
license=('GPL2')
depends=("alsa-lib" "ncurses")
changelog=$pkgname.changelog
source=("http://atariarea.krap.pl/stymulator/files/$_realpkgname-$pkgver.tar.gz")
md5sums=("e6ab8164dfac0300bb91a82f6e704841")

prepare() {
    cd "$_realpkgname-$pkgver/src"

    # Patch Makefile to remove hardcoded /usr/bin installation directory
    sed -i "s/\/usr\/bin$/\$(DESTDIR)/g" Makefile
    cat Makefile
}

build() {
    cd "$_realpkgname-$pkgver/src"
    make
}

package() {
    cd "$_realpkgname-$pkgver/src"
    mkdir -p $pkgdir/usr/bin
    make DESTDIR="$pkgdir/usr/bin" install
}
