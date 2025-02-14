# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=vsearch
pkgver=2.29.4
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=('x86_64' 'aarch64' 'ppc64le')
url="https://github.com/torognes/vsearch"
license=('BSD-2-Clause OR GPL-3.0-only')
depends=('glibc' 'zlib' 'bzip2')
makedepends=('ghostscript')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee55e764b01f538c4f3d3cf23b4550fe14d7a5922a8969ba14904dbb66064985')

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
