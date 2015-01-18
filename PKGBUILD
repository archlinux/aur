# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: furester <furester at gmail.com>

_pkgname=lightmediascanner
pkgname=$_pkgname-git
pkgver=0.5.0.r0.g2f4dd51
pkgrel=1
pkgdesc="Lightweight library to scan media - Development version"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite3' 'libmp4v2' 'ffmpeg' 'file')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/profusion/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed 's/^release_//;s/-/.r/;s/-/./g'
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
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS NEWS README TODO
}
