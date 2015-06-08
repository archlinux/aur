# Maintainer:
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=ghemical
pkgver=3.0.0
pkgrel=3
pkgdesc='Computational chemistry package'
license=("GPL")
arch=('x86_64' 'i686')
url='http://bioinformatics.org/ghemical/ghemical/'
depends=('libghemical>=3.0' 'liboglappth>=1.0' 'libglade' 'gtkglext' 'openbabel')
makedepends=('pkgconfig' 'intltool>=0.40.0' 'gettext')
source=("http://bioinformatics.org/ghemical/download/release20111012/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('babb2bda93cf0c20f234452eeb7d19d1d8c0e4c4d611734f110f8de066a1bcb2'
            '475db7721deff079feda637e9ecfc2ee7a381aa574fd3126c9eea7d71b9dd100')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Some users have reported crashes due to the courier font.
  sed -i 's:courier 12:monospace:g' ./src/*.cpp
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
