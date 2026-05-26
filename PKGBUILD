# Maintainer: bobi

pkgname=germinal
pkgver=29
pkgrel=1
pkgdesc="Minimalist terminal emulator based on vte and tmux"
gdeskpatch="gnome-desktop.patch"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz"
	"$gdeskpatch")

makedepends=('intltool' 'appstream-glib' 'meson' 'cmake')

depends=('glib2' 'vte4' 'pango' 'tmux' 'pcre2' 'libadwaita')

install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('710c9098cf6d5f22622e4f124153a31a'
         'f5b9996bcb2856ce3e2f91d739f81612')

build () {
    cp $gdeskpatch "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < $gdeskpatch

    meson setup _build --prefix=/usr
    ninja -C _build
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C _build install
}
