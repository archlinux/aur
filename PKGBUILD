# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Josh Marshall <jrmarsha@mtu.edu>
pkgname=hmmer
pkgver=3.4
pkgrel=2
pkgdesc="Profile hidden Markov models (HMMs) for database searching using consensus sequences"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
checkdepends=('python')
url="http://hmmer.org/"
source=(hmmer-$pkgver-release.tar.gz::https://eddylab.org/software/hmmer/hmmer-$pkgver.tar.gz)
sha256sums=('ca70d94fd0cf271bd7063423aabb116d42de533117343a9b27a65c17ff06fbf3')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 easel/LICENSE "$pkgdir/usr/share/licenses/$pkgname/easel.LICENSE"
}
