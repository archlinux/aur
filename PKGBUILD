# Maintainer: Rodrigo Arias Mallo <rodarima@gmail.com>

pkgname=dillo-git
pkgver=v3.3.0.r8.g92f89c8
pkgrel=1
pkgdesc="A small, fast graphical web browser built on FLTK"
arch=(x86_64)
url="https://dillo-browser.org/"
license=('GPL-3.0-or-later')
depends=('fltk1.3' 'libjpeg' 'perl' 'openssl' 'libpng' 'libwebp' 'gcc-libs' 'libxcursor'
         'libxi' 'libxinerama' 'brotli')
conflicts=('dillo')
backup=(etc/dillo/{dillorc,dpidrc})
source=(git+https://git.dillo-browser.org/dillo)
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
