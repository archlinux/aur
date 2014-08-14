# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=1.11.0beta1
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'elementary' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt')
makedepends=('cmake' 'perl' 'python2' 'ruby' 'gperf')
source=("http://download.enlightenment.org/rel/libs/webkit-efl/$pkgname-1.11.0-beta1.tar.xz")
sha256sums=('7d0545f79be3633973eb7340318552f80a213c5afddd2c3fee5ccd543cc0418d')

build() {
  cd "$srcdir/$pkgname"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
  install -m755 bin/MiniBrowser "$pkgdir/usr/bin/MiniBrowser-ewk"

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" Source/WebCore/LICENSE-{APPLE,LGPL-2}
}
