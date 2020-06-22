# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=gpxviewer-git
arch=('i686' 'x86_64')
pkgver=r319.905f33f
pkgrel=1
pkgdesc="a simple program to visualize a gpx file (git)"
license=('GPL2')
# url="http://blog.sarine.nl/gpx-viewer/"
url="https://github.com/DaveDavenport/gpx-viewer"
depends=('vala' 'libchamplain' 'intltool' 'gdl')
conflicts=(gpxviewer-bzr)
replaces=(gpxviewer-bzr)
makedepends=('git' 'meson')
source=("${pkgname}"::git+https://github.com/DaveDavenport/gpx-viewer.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  meson --prefix /usr --buildtype=plain . builddir
  ninja -C builddir
}

package() {
  cd $srcdir/$pkgname
  DESTDIR="$pkgdir" ninja -C builddir install
}
