# Maintainer: bobi

pkgname=germinal
pkgver=26
pkgrel=2
pkgdesc="Minimalist terminal emulator based on vte and tmux"
gdeskpatch="gnome-desktop.patch"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz"
	"$gdeskpatch")

makedepends=('intltool' 'appstream-glib')

depends=('glib2' 'vte3' 'pango' 'tmux' 'pcre2')

install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('8d22320954de55a098b772b2037a1455'
         'f5b9996bcb2856ce3e2f91d739f81612')

build () {
    cp $gdeskpatch "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < $gdeskpatch

    ./configure --sysconfdir=/etc       \
		--libexecdir=/usr/lib
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
# expandtab:tabstop=4:shiftwidth=4
