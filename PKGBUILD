# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=vsearch
pkgver=2.25.0
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis"
arch=('x86_64' 'aarch64' 'ppc64le')
url="https://github.com/torognes/vsearch"
license=('BSD-2-Clause OR GPL-3.0-only')
depends=('zlib' 'bzip2')
makedepends=('ghostscript')
source=("https://github.com/torognes/vsearch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7e25638924e56591d7c6ac3a959795000439937f5b566be7f06457bb31f91a9')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
