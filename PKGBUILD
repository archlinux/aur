# Contributor: Louis-Guillaume Gagnon <louis.guillaume.gagnon@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-c-git
pkgver=4.7.7.r6.g65a7a90
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (via C) - git version"
arch=('i686' 'x86_64')
url="http://gambitscheme.org"
license=('Apache' 'LGPL2.1')
depends=(ba'sh')
makedepends=('git')
provides=('gambit-c')
conflicts=('gambit-c')
install="$pkgname.install"
options=('!makeflags' 'staticlibs')
source=(git+https://github.com/feeley/gambit.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gambit"
    #    git log -1 --format='%cd.%h' --date=short | tr -d -
    git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
	cd "$srcdir/gambit"
	CC=gcc CXX=g++ ./configure \
            --prefix=/usr \
            --docdir=/usr/share/gambit-c \
            --infodir=/usr/share/info \
            --libdir=/usr/lib/gambit-c \
            --enable-single-host \
            --enable-compiler-name=gambitc
        make 
}

package() {
	cd "$srcdir/gambit"
	make DESTDIR="$pkgdir/" install
        ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}
