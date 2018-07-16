# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=dibuja
pkgver=0.8.0
pkgrel=3
pkgdesc="Gtk based basic paint program like classic MS Paint or Paintbrush for Mac but for Linux"
url="https://launchpad.net/dibuja"
source=("https://launchpad.net/dibuja/trunk/$pkgver/+download/dibuja-$pkgver.tar.gz" "gegl-0.4.diff")
md5sums=('d52bff73ba5f18431220d6055ee78589'
         '45d19703bb686d56e5c982b33f83533d')
license=("GPL3")
arch=("x86_64")
depends=(gtk2 gegl)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np0 -i "$srcdir/gegl-0.4.diff"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoconf
    ./configure --prefix=/usr --libdir=/usr/lib --with-gegl-0.4
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
