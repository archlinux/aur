# Maintainer: Rodrigo Arias Mallo <rodarima@gmail.com>

pkgname=dillo-git
pkgver=v3.2.0.r60.g8429930
pkgrel=1
pkgdesc="A small, fast graphical web browser built on FLTK"
arch=(x86_64)
url="https://github.com/dillo-browser/dillo"
license=('GPL')
depends=('fltk1.3' 'libjpeg' 'perl' 'openssl' 'libpng' 'libwebp' 'gcc-libs' 'libxcursor'
         'libxi' 'libxinerama')
conflicts=('dillo')
backup=(etc/dillo/{dillorc,dpidrc})
source=(git+https://github.com/dillo-browser/dillo.git)
sha256sums=('SKIP')

build() {
  cd "$srcdir/dillo"
  ./autogen.sh
  # FLTK 1.4 not yet supported
  ./configure --prefix=/usr --sysconfdir=/etc FLTK_CONFIG=/usr/bin/fltk-config1.3
  make
}

pkgver() {
  cd "$srcdir/dillo"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/dillo"
  make DESTDIR="$pkgdir" install
}
