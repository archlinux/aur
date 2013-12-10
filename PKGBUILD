# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: furester <furester at gmail.com>

pkgname=lightmediascanner-git
_pkgname=${pkgname%-*}
pkgver=0.4.5.r114.g1f7b0f2
pkgrel=1
pkgdesc="Lightweight library to scan media - Development version"
arch=('i686' 'x86_64')
url="http://lms.garage.maemo.org/"
license=('LGPL')
depends=('sqlite3' 'libvorbis' 'libmp4v2' 'flac' 'libtheora' 'glib2')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.profusion.mobi/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/.*_//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
