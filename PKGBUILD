# Maintainer: Maks Verver <maksverver@geocities.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=golly
pkgver=2.7
pkgrel=2
pkgdesc="A simulator for Conway's Game of Life and other cellular automata"
arch=('i686' 'x86_64')
url="http://golly.sourceforge.net/"
license=('GPL')
depends=('wxgtk>=2.8')
makedepends=('gendesk' 'perl' 'python2')
optdepends=('perl: for Perl scripting support'
            'python2: for Python scripting support')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz)
sha256sums=('4ee86e42e16c09e41aa8492f66e5a4a1ea7a130c5abc43d962e2f1d5604bd971')

build() {
    cd "$srcdir/$pkgname-$pkgver-src"

    gui-wx/configure/configure \
        --with-perl-shlib=/usr/lib/perl5/core_perl/CORE/libperl.so \
        --with-python-shlib=libpython2.7.so \
        --prefix=/usr

    make

    gendesk -n "$startdir"/PKGBUILD
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src"

    make DESTDIR="$pkgdir" install

    install -D -m644 "$pkgname.desktop" \
        "$pkgdir"/usr/share/applications/"$pkgname.desktop"
    install -D -m644 gui-wx/icons/appicon.xpm \
        "$pkgdir"/usr/share/pixmaps/"$pkgname.xpm"
}
