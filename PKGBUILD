# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: furester <furester at gmail.com>

_pkgname=lightmediascanner
pkgname=$_pkgname-git
pkgver=0.5.1.r18.gadfddb3
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
  cd $_pkgname

  git describe --tags --long | sed 's/^release_//;s/-/.r/;s/-/./g'
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS NEWS README TODO
}
