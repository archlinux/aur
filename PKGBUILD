# From the "Community" gcstar:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgname=gcstar
pkgname="${_pkgname}-svn"
pkgver=r2261
pkgrel=1
pkgdesc="A collection management application"
arch=('any')
url="http://www.gcstar.org"
license=("GPL")
depends=('gtk2-perl' 'perl-libwww' 'perl-xml-simple'
	 'perl-net-snmp' 'perl-xml-parser' 'perl-switch'
	 'perl-xml-libxml' 'perl-sort-naturally'
	 'perl-http-message' 'perl-http-date' 'perl-http-cookies'
	 'perl-gd' 'perl-date-calc'
	 'perl-archive-zip' 'perl-datetime-format-strptime'
	 'perl-gdgraph' 'perl-mp3-info')
# 'perl-ogg-vorbis-header-pureperl' 'perl-mp3-tag'
makedepends=('subversion')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::svn://svn.gna.org/svn/gcstar/trunk")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
  cd $srcdir/$_pkgname/$_pkgname
  ./install  --prefix=$pkgdir/usr
  install -D -m644 $pkgdir/usr/share/gcstar/icons/gcstar_256x256.png \
                   $pkgdir/usr/share/pixmaps/gcstar.png
  install -D -m644 $pkgdir/usr/share/gcstar/icons/gcstar_32x32.png \
                   $pkgdir/usr/share/pixmaps/gcstar32.png
  cp -R share/applications $pkgdir/usr/share
  mv $pkgdir/usr/man $pkgdir/usr/share
}
