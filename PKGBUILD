# Maintainer: javy

pkgname=libernull
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal markup-based typesetting system for authors/writers"
arch=('x86_64')
url="https://codeberg.org/javy/libernull"
license=('MIT')
depends=('util-linux-libs' 'libundr' 'libzip' 'libepub')
makedepends=('gcc')
provides=('libernull')
conflicts=('libernull')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('5eb0d04a0fe9911fea491861e775c8f20c803af4cdbf1ae09d8ee4c71863f7ef778997604418e65007474d65347e5bfc55cbcf9573891e27d86f3e39320103cb')

build() {
  cd "${pkgname}"
  gcc -Wall -Wextra -std=c23 -pedantic src/*.c -o libernull -lundr -lcurl -lepub -luuid -lzip
}

package() {
  cd "${pkgname}"
  
  install -Dm755 libernull "${pkgdir}/usr/bin/libernull"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 man/libernull.1 "${pkgdir}/usr/share/man/man1/libernull.1"
}
