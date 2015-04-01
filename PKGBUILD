# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=1.11.0
pkgrel=2
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt')
makedepends=('cmake' 'perl' 'python2' 'ruby' 'gperf')
source=("http://download.enlightenment.org/rel/libs/webkit-efl/$pkgname-$pkgver.tar.xz")
sha256sums=('d8d21e27f4a21cd77c41914548c184ddb98693ba23851aa66c8e51c0be4b90b7')

build() {
  cd "$srcdir/$pkgname"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TOOLS=OFF

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" Source/WebCore/LICENSE-{APPLE,LGPL-2}
}
