# Maintainer: cth451 <cth451@gmail.com>

pkgname=linthesia
pkgver=0.4.3
pkgrel=1
pkgdesc="A game of playing music. A fork of Synthesia"
arch=('i686' 'x86_64')
url="http://linthesia.sourceforge.net/"
license=('GPL2')
depends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'fluidsynth')
makedepends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'svn')
source=("svn+http://svn.code.sf.net/p/linthesia/code/#revision=r87")
sha256sums=('SKIP')

build() {
    cd "$srcdir/code/src"
    make GRAPHDIR="/usr/share/linthesia/graphics"
    cd "$srcdir/code/extra"
    sed "s/Exec=linthesia/Exec=\/usr\/games\/linthesia/g" linthesia.desktop > linthesia.desktop.new
}

package () {
    cd "$srcdir/code"
    make DESTDIR="$pkgdir" install
    # Install desktop file
    mkdir "$pkgdir/usr/share/applications"
    install -Tm644 extra/linthesia.desktop.new $pkgdir/usr/share/applications/linthesia.desktop 
    # Install pixmap
    mkdir "$pkgdir/usr/share/pixmaps"
    install -Tm644 extra/linthesia.xpm $pkgdir/usr/share/pixmaps/linthesia.xpm
    # Install docs
    mkdir "$pkgdir/usr/share/doc"
    mkdir "$pkgdir/usr/share/doc/linthesia"
    install -Tm644 README $pkgdir/usr/share/doc/linthesia/README
    install -Tm644 COPYING $pkgdir/usr/share/doc/linthesia/COPYING
}
