# $Id$
# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: yosh64 <yosh64.at.gmail.dot.com>

pkgname=mtpaint-wjaguar
pkgver=3.49.19
pkgrel=1
_commit="a9e445ef0167631363fe954bd3ea7aec7853ca1a"
pkgdesc='Simple paint program for creating icons and pixel based artwork (Dmitry Groshev''s fork)'
arch=('x86_64')
url='https://github.com/wjaguar/mtPaint'
license=('GPL3')
depends=('gtk2' 'giflib' 'openjpeg' 'lcms2' 'libwebp' 'libtiff')
optdepends=('gifsicle: for exporting GIF files from mtPaint')
provides=('mtpaint')
conflicts=('mtpaint')
source=("mtpaint-$pkgver.zip::https://github.com/wjaguar/mtPaint/archive/$_commit.zip")
sha256sums=('f78f53c247eb133a60fd75df8c1caf73d46e8de570afcd7a8e178ba85cb54a92')

prepare() {
  cd "mtPaint-$_commit"

  # Recommended by Mark Tyler himself
  sed -i 's:$LIBS $LDFLAGS:$LDFLAGS $LIBS:' configure
}

build() {
  cd "mtPaint-$_commit"

  export CFLAGS="-w `pkg-config libopenjpeg --cflags` $CFLAGS"
  ./configure --prefix=/usr --mandir=/usr/share/man man intl GIF jpeg tiff cflags lcms2 jp2 webp
  make
}

package() {
  make -C "mtPaint-$_commit" DESTDIR="$pkgdir" install
}

# vim:ts=2 sw=2 et:
