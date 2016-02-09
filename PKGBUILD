# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: mathieui <mathieui[at]mathieui.net>
# Contributor: rayanamukami <matthewchoi_123 at hotmail.com>

pkgname=oneko
pkgrel=4
pkgver=1.2.5
_pkgver="1.2.sakura.5"
pkgdesc="A cat that chases around your cursor"
arch=('x86_64' 'i686')
url="http://www.daidouji.com/oneko/"
license=('Public Domain')
depends=('libx11' 'libxext')
makedepends=('imake' 'make' 'desktop-file-utils')
source=("http://www.daidouji.com/$pkgname/distfiles/$pkgname-$_pkgver.tar.gz")
md5sums=('456b318fa6e61431bf4f0a42b110014a')

build() {
    cd "$srcdir/$pkgname-$_pkgver/"
    xmkmf -a
    make
}

package() {
    cd "$srcdir/$pkgname-$_pkgver/"
    _mandir="$pkgdir/usr/share/man"

    mkdir -p "$_mandir/man1/"
    mkdir -p "$_mandir/jp/man1/"
    mkdir -p "$pkgdir/usr/bin"

    make DESTDIR=$pkgdir install

    cp oneko.man "$_mandir/man1/oneko.1"
    cp oneko.man.jp "$_mandir/jp/man1/oneko.1"
    echo -e '#!/bin/sh'"\nxsetroot -cursor_name top_left_arrow || xsetroot -cursor_name left_ptr " > "$pkgdir/usr/bin/oneko-restore-cursor"
    chmod +x "$pkgdir/usr/bin/oneko-restore-cursor"
}
