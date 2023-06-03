# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=ghemical
pkgver=3.0.0
pkgrel=4
pkgdesc='Computational chemistry package'
license=("GPL")
arch=('x86_64' 'i686')
url='https://bioinformatics.org/ghemical/ghemical/'
depends=('libghemical>=3.0' 'liboglappth>=1.0' 'libglade' 'gtkglext' 'openbabel')
makedepends=('pkgconfig' 'intltool>=0.40.0' 'gettext')
source=("https://bioinformatics.org/ghemical/download/release20111012/$pkgname-$pkgver.tar.gz"
        "openbabel3.patch" "$pkgname.desktop")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Some users have reported crashes due to the courier font.
  sed -i 's:courier 12:monospace:g' ./src/*.cpp
  patch -Np1 -i ../openbabel3.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  autoconf
  CXXFLAGS="-fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  make DESTDIR="$pkgdir" install
}

sha256sums=('babb2bda93cf0c20f234452eeb7d19d1d8c0e4c4d611734f110f8de066a1bcb2'
            'a41173dfb8c2beaca53b3796b8e6c9d6552f33a1dc4e41fa13b045ed31f54b1a'
            '475db7721deff079feda637e9ecfc2ee7a381aa574fd3126c9eea7d71b9dd100')
