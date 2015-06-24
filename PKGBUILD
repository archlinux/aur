# Maintainer: bobi

pkgname=gpaste
pkgver=3.16.2.1
pkgrel=1
pkgdesc="Clipboard management system with a gnome-shell extension"

license=('GPL3')
url="https://github.com/Keruspe/GPaste"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz")

makedepends=('gnome-control-center' 'gobject-introspection' 'vala' 'intltool')
options=(!libtool)

depends=('gnome-shell>=3.16.1')
optdepends=('wgetpaste>=2.26')
install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('935b66abf61e1a0d6385acdbecbb8134')

build () {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --sysconfdir=/etc       \
		--libexecdir=/usr/lib
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # bash/zsh completion support
    install -Dp -m0644 data/completions/$pkgname     \
        "$pkgdir/etc/bash_completion.d/$pkgname"
    install -Dp -m0644 data/completions/_$pkgname    \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
# expandtab:tabstop=4:shiftwidth=4
