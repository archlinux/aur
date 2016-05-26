# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Uwe Kaiser <ukaiser@gmail.com>
pkgname=loki-lib
pkgver=0.1.7
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A C++ library of designs, containing flexible implementations of common design patterns and idioms."
url="http://loki-lib.sourceforge.net/"
license=('MIT')
source=("http://downloads.sourceforge.net/sourceforge/loki-lib/loki-$pkgver.tar.gz" \
        "build.patch")
md5sums=('005d79581fbe888ceabd65d46c99c8b1'
         '0abe0c2bf12532231ba5d204ed0169c7')

prepare() {
  cd "$srcdir/loki-$pkgver"
  patch -Np1 < "$srcdir/build.patch"
}

build() {
  cd "$srcdir/loki-$pkgver"
  make build-shared
}

check() {
  cd "$srcdir/loki-$pkgver"
  make check
}

package() {
  cd "$srcdir/loki-$pkgver"
  make prefix="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  echo "See license in header files." >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

