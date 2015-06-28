# Contributor: AaronP <aaronbpaden at that google place>

pkgname=ycurses-git
pkgver=20150727
pkgrel=2
conflicts=('ycurses')
pkgdesc="Curses bindings for the D Programming Language"
arch=('any');
url="http://code.google.com/p/ycurses/"
license=('MIT')

_gitroot="https://github.com/sakhmatd/ycurses"
_gitname=ycurses

sources=()
md5sums=()

package() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"

    find . -name "*.d" -exec sed -i s/typedef/alias/g '{}' \;
    
    install -Dm644 $srcdir/ycurses/modules/curses.d $pkgdir/usr/include/dlang/dmd/curses.d
    install -Dm644 $srcdir/ycurses/modules/eti.d $pkgdir/usr/include/dlang/dmd/eti.d
    install -Dm644 $srcdir/ycurses/modules/form.d $pkgdir/usr/include/dlang/dmd/form.d
    install -Dm644 $srcdir/ycurses/modules/menu.d $pkgdir/usr/include/dlang/dmd/menu.d
    install -Dm644 $srcdir/ycurses/modules/ncurses.d $pkgdir/usr/include/dlang/dmd/ncurses.d
    install -Dm644 $srcdir/ycurses/modules/panel.d $pkgdir/usr/include/dlang/dmd/panel.d

    mkdir -p $pkgdir/usr/share/doc/ycurses/candydoc/img/
    mkdir -p $pkgdir/usr/share/ycurses/examples

    cp -r $srcdir/ycurses/docs/*.html $pkgdir/usr/share/doc/ycurses/
    cp -r $srcdir/ycurses/docs/candydoc/*.{css,js} $pkgdir/usr/share/doc/ycurses/candydoc/
    cp -r $srcdir/ycurses/docs/candydoc/img/* $pkgdir/usr/share/doc/ycurses/candydoc/img/	
    cp -r $srcdir/ycurses/examples/* $pkgdir/usr/share/ycurses/examples/
}
