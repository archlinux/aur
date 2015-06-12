# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: David Dent <thewinch@gmail.com>

pkgname=gpxviewer-bzr
arch=('i686' 'x86_64')
pkgver=247
pkgrel=1
pkgdesc="a simple program to visualize a gpx file"
license=('GPL2')
url="http://blog.sarine.nl/gpx-viewer/"
depends=('vala' 'libchamplain' 'intltool' 'gdl')
makedepends=('bzr')
conflicts=('gpxviewer')
_bzrtrunk=lp:~gpx-viewer-team/gpx-viewer/port-to-libchamplain-0.12
_bzrmod=$pkgname

build() {
cd $srcdir
msg "Connecting to the server...."
if [ ! -d $_bzrmod/.bzr ]; then
bzr co $_bzrtrunk $_bzrmod
else
bzr up $_bzrmod
fi

msg "Bazaar checkout done or server timeout"
cd $pkgname
sed -i '/1.7/s/automake_progs="/&automake-1.12 /' autogen.sh
./autogen.sh
./configure --prefix=/usr
make
}

package() {
cd $srcdir/$pkgname
make DESTDIR=$pkgdir install
}
