# Contributor: Alois Nespor <info at aloisnespor dot info>
pkgname=gst-mpg123
pkgver=20121118
pkgrel=1
pkgdesc="MP3 decoding for gstreamer-0.10, using the mpg123 library"
arch=(any)
url="https://github.com/dv1/${pkgname/-/}"
license=(LGPL)
depends=(gstreamer0.10-base mpg123 python2)
makedepends=(pkgconfig git)

prepare() {
  git clone $url
  cd ${pkgname/-/}
  echo "Configuring..."
  sed -i 's:python:python2:' waf
  sed -i 's:python:python2:' wscript
}

build() {
  cd ${pkgname/-/}
  ./waf configure build_0_10 --prefix=/usr --disable-gstreamer-1-0

}

package() {
  cd ${pkgname/-/}
  DESTDIR="$pkgdir" ./waf install_0_10
}
