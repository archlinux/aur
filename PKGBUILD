# Maintainer: Kaan Genç  <aur@kaangenc.me>
pkgname=libcsv
pkgver=3.0.3
pkgrel=1
pkgdesc="A small, simple and fast CSV library written in pure ANSI C89 that can read and write CSV data."
arch=('i686' 'x86_64')
url="https://github.com/robertpostill/libcsv"
license=('LGPL')
source=("git+https://github.com/robertpostill/$pkgname.git")
md5sums=('SKIP')


prepare() {
  cd "$srcdir/$pkgname"

  # Replace the outdated config.sub and config.guess files. Otherwise,
  # the package doesn't build.
  cp /usr/share/libtool/build-aux/config.{sub,guess} .
}


build() {
  cd "$srcdir/$pkgname"

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man
  make
}

check() {
  cd "$srcdir/$pkgname"

  make check
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
