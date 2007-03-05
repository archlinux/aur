# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_nylonpkgname=nylon-build-stable
_nylonpkgver=1.0
pkgname=nylon-gnu-config
pkgver=1.0
pkgrel=1
pkgdesc="GNU configure tool from Nylon"
url="http://www.meshcube.org"
depends=(bash)
makedepends=(patcher)
source=(http://meshcube.org/nylon/stable/$_nylonpkgname-$_nylonpkgver.tar.gz)
md5sums=('4f9edec77ee925b1e24a13c55f4dbb99')
provides=(gnu-config)

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/usr/bin/
	cat $startdir/src/nylon-build-stable-1.0/openembedded/packages/gnu-config/gnu-config/gnu-configize.in | \
		sed -e 's,@gnu-configdir@,/usr/share/gnu-config,' \
		    -e 's,@autom4te_perllibdir@,/usr/share/autoconf,' > $startdir/pkg/usr/bin/gnu-configize
	chmod 755 $startdir/pkg/usr/bin/gnu-configize
	wget -q http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess \
	 http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub
	 install -d $startdir/pkg/usr/share/gnu-config/
	 install -m 0644 config.guess config.sub  $startdir/pkg/usr/share/gnu-config/
}
