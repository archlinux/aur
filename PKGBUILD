# Maintainer: jose1711 <jose1711@gmail.com>
pkgname=orp-svn
pkgver=21341
pkgrel=1
pkgdesc="Osmarender in Perl - a complete re-implemenation of Osmarender in Perl"
arch=('i686' 'x86_64')
depends=('perl-xml-libxml' 'perl-xml-xpath' 'perl-set-object' 'perl-xml-writer' 'libxml-perl')
url="http://wiki.openstreetmap.org/wiki/Osmarender/orp"
license=('GPL')
provides=('orp')

_svntrunk="http://svn.openstreetmap.org/applications/rendering/osmarender/orp/"

build() {
true
}

package() {
        cd $srcdir

        # get the sources
        msg "Connecting to $_svntrunk ..."
        if [ -d $_svnmod/.svn ]; then
                (cd $_svnmod && svn up) || return 1
        else
                svn co $_svntrunk || return 1
        fi
        msg "SVN checkout done or server timeout"

	cd $srcdir/orp
	install -d $pkgdir/usr/share/orp/orp
        install -Dm 644 * $pkgdir/usr/share/orp/orp
	install -Dm 755 ./orp.pl $pkgdir/usr/share/orp/orp/orp.pl

	cd $pkgdir/usr/share/orp
	svn co http://svn.openstreetmap.org/applications/rendering/osmarender/stylesheets/
	find $pkgdir/usr/share/orp/stylesheets -depth -type d -name ".svn" -exec rm -r '{}' \;
	}
