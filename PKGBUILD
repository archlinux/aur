# Maintainer: Adrian Freund <freundadrian@gmail.com>
pkgname=playerctl-git
_pkgname=playerctl
pkgver=0.4.2.r4.gfda38a6
pkgrel=1
pkgdesc="mpris media player controller and lib for spotify, vlc, audacious, bmp, xmms2, and others."
arch=('i686' 'x86_64')
url="https://github.com/acrisci/playerctl"
license=('LGPL3')
depends=('glib2' 'gobject-introspection')
optdepends=('python-gobject: python bindings')
makedepends=('git' 'gtk-doc')
provides=('playerctl')
conflicts=('playerctl')
source=("$_pkgname::git+https://github.com/acrisci/playerctl.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh --prefix=/usr
    make -j1
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" install
}
