# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=gpxviewer-git
arch=('i686' 'x86_64')
pkgver=r315.640382e
pkgrel=1
pkgdesc="a simple program to visualize a gpx file (git)"
license=('GPL2')
# url="http://blog.sarine.nl/gpx-viewer/"
url="https://github.com/jose1711/gpx-viewer"
depends=('vala' 'libchamplain' 'intltool' 'gdl')
conflicts=(gpxviewer-bzr)
replaces=(gpxviewer-bzr)
makedepends=('git')
source=("${pkgname}"::git+https://github.com/jose1711/gpx-viewer.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd ${srcdir}/${pkgname}
./autogen.sh
./configure --prefix=/usr
make
}

package() {
cd $srcdir/$pkgname
make DESTDIR=$pkgdir install
rm -r ${pkgdir}/usr/share/mime
rm ${pkgdir}/usr/share/applications/mimeinfo.cache
}
