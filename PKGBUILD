# Maintainer: jose1711 <jose1711@gmail.com>
pkgname=orp-svn
pkgver=r31608
pkgrel=1
pkgdesc="Osmarender in Perl - a complete re-implemenation of Osmarender in Perl"
arch=('i686' 'x86_64')
depends=('perl-xml-libxml' 'perl-xml-xpath' 'perl-set-object' 'perl-xml-writer' 'libxml-perl')
url="http://wiki.openstreetmap.org/wiki/Osmarender/orp"
license=('GPL')
source=('orp::svn+http://svn.openstreetmap.org/applications/rendering/osmarender/orp' 'orp.pl.patch')

pkgver() {
 cd "${pkgname%%-svn}"
 local ver="$(svnversion)"
 printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
	cd $srcdir/orp
	patch -p0 < $srcdir/orp.pl.patch
	install -d $pkgdir/usr/share/orp/orp
        install -Dm 644 * $pkgdir/usr/share/orp/orp
	install -Dm 755 ./orp.pl $pkgdir/usr/share/orp/orp/orp.pl

	cd $pkgdir/usr/share/orp
	svn co http://svn.openstreetmap.org/applications/rendering/osmarender/stylesheets/
	find $pkgdir/usr/share/orp/stylesheets -depth -type d -name ".svn" -exec rm -r '{}' \;
	}
md5sums=('SKIP'
         '25bf26a5a39150ede6a43e9c9fe3d8ce')
