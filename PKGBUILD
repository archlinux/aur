# $Id$
# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: yosh64 <yosh64.at.gmail.dot.com>

pkgname=mtpaint-wjaguar
pkgver=3.49.21
pkgrel=1
_commit="deb347c5df910d52b874c480da3234d1bbe78838"
pkgdesc='Simple paint program for creating icons and pixel based artwork (Dmitry Groshev''s fork)'
arch=('x86_64')
url='https://github.com/wjaguar/mtPaint'
license=('GPL3')
depends=('gtk2' 'giflib' 'openjpeg' 'lcms2' 'libwebp' 'libtiff')
optdepends=('gifsicle: for exporting GIF files from mtPaint')
provides=('mtpaint')
conflicts=('mtpaint')
source=("mtpaint-$pkgver.zip::https://github.com/wjaguar/mtPaint/archive/$_commit.zip")
sha256sums=('fdc64526f6a342ba6c65336aaf08b070ad0aac6ced81ca623ed8c3152ae01a9a')

prepare() {
  cd "mtPaint-$_commit"

  # Recommended by Mark Tyler himself
  sed -i 's:$LIBS $LDFLAGS:$LDFLAGS $LIBS:' configure
}

build() {
  cd "mtPaint-$_commit"

  # It makes problems on my end, so i commented it out:
  #export CFLAGS="-w `pkg-config libopenjpeg --cflags` $CFLAGS"
  
  ./configure --prefix=/usr --mandir=/usr/share/man man intl GIF jpeg tiff cflags lcms2 jp2 webp
  make
}

package() {
  make -C "mtPaint-$_commit" DESTDIR="$pkgdir" install
}

# vim:ts=2 sw=2 et:
