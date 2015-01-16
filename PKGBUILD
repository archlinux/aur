# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Igor Scabini <furester at gmail.com>

pkgname=lightmediascanner
pkgver=0.5.0
pkgrel=1
pkgdesc="Lightweight library to scan media"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite3' 'libmp4v2' 'ffmpeg' 'file')
source=("https://github.com/profusion/lightmediascanner/archive/release_$pkgver.tar.gz")
sha256sums=('694e73d8c7128f08f3dafbe57f5d1ade9a80337d7ac5b82c4e06d0effb9e5d51')

prepare() {
  sed -i '/AC_INIT/ s/0\.5,/0.5.0,/' "$srcdir/$pkgname-release_$pkgver/configure.ac"
}

build() {
  cd "$srcdir/$pkgname-release_$pkgver"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-release_$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS NEWS README TODO
}
