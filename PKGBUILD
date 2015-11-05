# Maintainer: bobi

pkgname=germinal
pkgver=14
pkgrel=2
pkgdesc="Minimalist terminal emulator based on vte and tmux"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz" "cwd.patch")

makedepends=('intltool')

depends=('glib2' 'vte3' 'pango' 'tmux')

install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('0d1498921837833d8a2395cf2a9768b9'
         'd1eec5fef2efd7b0586b4c235fb45556')

build () {
	cp cwd.patch "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < cwd.patch

    ./configure --sysconfdir=/etc       \
		--libexecdir=/usr/lib
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
# expandtab:tabstop=4:shiftwidth=4
