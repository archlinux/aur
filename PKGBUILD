# $Id$
# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: yosh64 <yosh64.at.gmail.dot.com>

pkgname=mtpaint-wjaguar
pkgver=3.49.15
pkgrel=4
_commit="91676e939e1198fa536a0cdefbcd9331c70efc4c"
pkgdesc='Simple paint program for creating icons and pixel based artwork (Dmitry Groshev''s fork)'
arch=('x86_64')
url='https://github.com/wjaguar/mtPaint'
license=('GPL3')
depends=('gtk2' 'giflib' 'openjpeg' 'lcms2' 'libwebp' 'libtiff')
optdepends=('gifsicle: for exporting GIF files from mtPaint')
provides=('mtpaint')
conflicts=('mtpaint')
source=("https://github.com/wjaguar/mtPaint/archive/$_commit.zip")
sha256sums=('94cbb124219f11664639492114eb65185b6f0ffe04f505609f6784842e718554')

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
