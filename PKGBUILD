# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=littleutils
pkgver=1.0.33
pkgrel=1
pkgdesc="Utils for image optimization, finding file dups, cleaning source."
arch=('i686' 'x86_64')
url="http://littleutils.sourceforge.net"
license=('GPL3')
depends=('perl' 'bash' 'libpng')
optdepends=('gifsicle: for opt-gif'
            'pngcrush: for opt-png'
            'lzip: for to-lzip'
            'python2: for zip2tarcat')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-source/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('6d382376e676d5f2bc9c5c652f15c697')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -i 's|/usr/bin/dash|/usr/bin/bash|' {scripts,repeats}/*
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  sed -i "s|$pkgdir|/|" "$pkgdir/usr/bin/repeats"
  #make DESTDIR="$pkgdir" install-extra  # feeling brave?
}

