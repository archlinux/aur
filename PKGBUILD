# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
_pkgepoch=2.0
pkgver=2.0.1
pkgrel=3
pkgdesc="A simple Qt6 frontend to MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/quimup/"
license=('GPL2')
makedepends=()
depends=('mpd' 'qt6-base' 'taglib')
source=("quimup-$pkgver-source.tar.gz::https://sourceforge.net/projects/quimup/files/Quimup%20$_pkgepoch/Quimup-$pkgver.source.tar.gz"
        'format-security.patch')

prepare() {
  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"

  patch -p0 -i "$srcdir/format-security.patch"
}

build() {
  cd build
  qmake6 PREFIX=/usr -Wnone "../Quimup"
  make
}

package() {
  # there is no install target
  install -Dm755 "$srcdir/build/quimup" "$pkgdir/usr/bin/quimup"
}

sha512sums=('fa4090bf4b573b5bd5b370a10e22dfac1608226cf6939e9a722bebf373218e12b8298a7b17e1eab241617ebd9bc5ddfe297f87a71daf0bcb3100bc1c902ee068'
            'b3b1b8318c8b29892eb2c197ab4a2c76c767b09ca904b2c20a6fb84f4315cb14adfbc9752d9c7a920c24aade3225a111c9ed0b253870d60ecfefb88fa0b67766')
