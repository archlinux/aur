# Maintainer: Hexchain Tong <i@hexchain.org>
# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vlock-original
pkgver=2.2.3
pkgrel=1
pkgdesc="A small console locking program"
url="http://cthulhu.c3d2.de/~toidinamai/vlock/vlock.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('pam')
install=$pkgname.install
source=("ftp://harrier.slackbuilds.org/misc/vlock-${pkgver}.tar.gz")
md5sums=('378175c7692a8f288e65fd4dbf8a38eb')

build() {
    cd "$srcdir/vlock-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/vlock-$pkgver"
    make DESTDIR="$pkgdir" VLOCK_GROUP=129 install

    find "$pkgdir" -type f -name 'vlock*' -exec sh -c '
    dir=${0%/*}
    file=${0##*/}

    mv "$0" "$dir/${file/vlock/vlock-original}"' {} \;
    sed -i 's/vlock-main/vlock-original-main/' "$pkgdir"/usr/bin/vlock-original
}
