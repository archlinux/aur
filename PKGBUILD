# Maintainer: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
pkgname=execline-musl
pkgver=2.0.2.0
pkgrel=2
pkgdesc="A (non-interactive) scripting language, like sh. Statically linked against musl."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/execline"
license=('custom:ISC')
makedepends=('skalibs-musl>=2.2.1.0' 'musl')
provides=(execline=2.0.2.0)
options=('staticlibs')
changelog=CHANGELOG
source=("${url}/execline-$pkgver.tar.gz" 'execlineb.eb')
sha256sums=('73aa2db6e253f1821361033028d9b77733b799f93e4d7d477e4230534d7fce32'
            '8fe12757dc79669237d23f2a883ba60215b0cb9dd51c597783d628cadcf1af8e')

build() {
  cd "$srcdir/execline-$pkgver"

  CC="musl-gcc" ./configure --enable-static-libc --bindir=/usr/lib/execline --with-include=/usr/include
  make
}

package() {
  cd "$srcdir/execline-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m755 "$srcdir/execlineb.eb" "$pkgdir/usr/bin/execlineb"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
