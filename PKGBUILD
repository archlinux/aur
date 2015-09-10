# Maintainer: bobi

pkgname=germinal
pkgver=12
pkgrel=2
pkgdesc="Minimalist terminal emulator based on vte and tmux"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz" "tmuxsession.patch")

makedepends=('intltool')

depends=('glib2' 'vte3' 'pango' 'tmux')

arch=('i686' 'x86_64')
md5sums=('e75233bb63d21e5f10314b4ef2f81366'
         '50ebbeb73945bb2bf26ed713e33da733')

build () {
	cp tmuxsession.patch "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
	patch -p0 < tmuxsession.patch

    ./configure --sysconfdir=/etc       \
		--libexecdir=/usr/lib
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
# expandtab:tabstop=4:shiftwidth=4
