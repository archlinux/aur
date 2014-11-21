# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Igor Scabini <furester at gmail.com>

pkgname=lightmediascanner
pkgver=0.4.5
pkgrel=2
pkgdesc="A lightweight library to scan media"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite3' 'libvorbis' 'libmp4v2' 'flac')
source=("https://github.com/profusion/lightmediascanner/archive/release_$pkgver.tar.gz")
sha256sums=('73d9e86aa506f89084f6132e32c58b15dc9a364b8c812a160896c44d36392949')

build() {
  cd "$srcdir/$pkgname-release_$pkgver"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname-release_$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS NEWS README
}
