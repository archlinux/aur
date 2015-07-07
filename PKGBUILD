# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor : AdrianoML

pkgname=vorbis-tools-svn
pkgver=19492
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Extra tools for Ogg-Vorbis"
url="http://www.xiph.org/vorbis"
license=('GPL2')
depends=('libao>=1.0.0' 'libvorbis' 'curl>=7.16.2')
makedepends=('subversion')
provides=('vorbis-tools=1.4.0')
conflicts=('vorbis-tools')

_svnmod=vorbis-tools
source=('svn+http://svn.xiph.org/trunk/vorbis-tools/')

pkgver() {
  cd "$_svnmod"
  svnversion
}

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/$_svnmod-build"
  ./autogen.sh --prefix=/usr --without-speex --enable-vcut
  ./configure --prefix=/usr  --without-speex --enable-vcut

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install

  rm -rf "$srcdir/$_svnmod-build"
}
sha1sums=('SKIP')
