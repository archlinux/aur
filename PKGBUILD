# Maintainer: sputnick <gilles DOT quenot AT gmail>
# Contributor: Muhammed Uluyol <muhammedu@gmail.com>

pkgname=gwinwrap-svn
pkgver=1
pkgrel=4
pkgdesc="Gwinwrap is a frontend to xwinwrap written in pygtk and glade"
url="http://code.google.com/p/gwinwrap"
arch=('i686' 'x86_64')
license=('GPL')
depends=('shantz-xwinwrap-bzr' 'python' 'pygtk' 'xscreensaver')
makedepends=('subversion')

source=('gwinwrap.bash')
md5sums=('16d6bc1b1e7ebf19e7fe1a4a8179c3c6')

_svntrunk=http://gwinwrap.googlecode.com/svn/trunk

build() {
    cd ${srcdir}

    if [[ -d trunk/.svn ]]; then
        (cd trunk && svn up)
    else
        svn co $_svntrunk
    fi

    msg "SVN checkout done or server timeout"
}

package() {
    install -Dm755 gwinwrap.bash $pkgdir/usr/bin/gwinwrap
    install -Dm755 trunk/gwinwrap.py $pkgdir/usr/share/gwinwrap/gwinwrap.py
    install -Dm755 trunk/gwinwrap.glade $pkgdir/usr/share/gwinwrap/gwinwrap.glade
    install -Dm777 trunk/prefs.gwrp $pkgdir/usr/share/gwinwrap/prefs.gwrp
    install -Dm777 trunk/presets.gwrp $pkgdir/usr/share/gwinwrap/presets.gwrp
}
