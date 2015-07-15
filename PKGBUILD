# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: David Dent <thewinch@gmail.com>

pkgname=gpxviewer-bzr
arch=('i686' 'x86_64')
pkgver=r296
pkgrel=1
pkgdesc="a simple program to visualize a gpx file"
license=('GPL2')
url="http://blog.sarine.nl/gpx-viewer/"
depends=('vala' 'libchamplain' 'intltool' 'gdl')
makedepends=('bzr')
conflicts=('gpxviewer')
#source=("${pkgname}"::bzr+lp:~gpx-viewer-team/gpx-viewer/port-to-libchamplain-0.12)
source=("${pkgname}"::bzr+lp:~chkr/gpx-viewer/gtk3-bugfix)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
cd ${srcdir}/${pkgname}
sed -i '/1.7/s/automake_progs="/&automake-1.15 /' autogen.sh
./autogen.sh
./configure --prefix=/usr
make || make
}

package() {
cd $srcdir/$pkgname
make DESTDIR=$pkgdir install
rm -r ${pkgdir}/usr/share/mime
rm ${pkgdir}/usr/share/applications/mimeinfo.cache
}
