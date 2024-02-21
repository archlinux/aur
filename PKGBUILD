# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=vsearch
pkgver=2.27.0
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=('x86_64' 'aarch64' 'ppc64le')
url="https://github.com/torognes/vsearch"
license=('BSD-2-Clause OR GPL-3.0-only')
depends=('glibc' 'zlib' 'bzip2')
makedepends=('ghostscript')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18d6fc919adce684c01fe57797e2adbf5b4d4f6cf5ef169378ad473797be38ae')

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
