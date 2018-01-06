# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=freewrl
epoch=1
pkgver=2.3.3.1
_pkgver=2.0
pkgrel=1
pkgdesc="VRML viewer"
arch=('x86_64')
url="http://freewrl.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'libxaw' 'glew' 'freeglut' 'curl' 'freetype2' 'imlib2' 'sox'
         'unzip' 'imagemagick' 'libxml2' 'ttf-bitstream-vera' 'js185' 'glu'
         'openal' 'freealut')
makedepends=('java-environment' 'xulrunner' 'wget' 'mesa')
source=(https://sourceforge.net/projects/freewrl/files/freewrl-linux/${_pkgver}/freewrl-${pkgver}.tar.gz)
sha256sums=('71ed11f5f3b4b6a1d2fc740e8e3ed62a83b484c9695968fac5e30db14dbb6fef')

build() {
  cd "$srcdir"/$pkgname-${pkgver%.*}
  ./configure \
    --prefix=/usr --with-fontsdir=/usr/share/fonts/TTF --enable-libeai \
    --enable-libcurl --with-expat=/usr --with-target=x11 --enable-plugin \
    --disable-mozilla-js --enable-xulrunner-js --disable-firefox-js \
    --disable-seamonkey-js
  make
}

package() {
  cd "$srcdir"/$pkgname-${pkgver%.*}
  make DESTDIR="$pkgdir" install
}
