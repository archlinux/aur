# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Igor Scabini <furester at gmail.com>

pkgname=lightmediascanner
pkgver=0.5.1
pkgrel=1
pkgdesc="Lightweight library to scan media"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite3' 'libmp4v2' 'ffmpeg' 'file')
source=("https://github.com/profusion/lightmediascanner/archive/release_$pkgver.tar.gz")
sha256sums=('d08434b957eb8b4e2d84cb081406ce86af20113a30f9d0d097e32b7a667f1174')

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
