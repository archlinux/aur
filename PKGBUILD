# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=minimap2-git
pkgver=2.17.r46.gc9874e2
pkgrel=1
pkgdesc="Aligner for genomic and spliced nucleotide sequences"
arch=('i686' 'x86_64')
url="https://lh3.github.io/minimap2/"
license=('MIT')
depends=('glibc' 'zlib')
makedepends=('git')
provides=('minimap2')
conflicts=('minimap2')
source=("git+https://github.com/lh3/minimap2.git")
sha256sums=('SKIP')


prepare() {
  cd "minimap2"

  sed -i 's/^LIBS=/LIBS= $(LDFLAGS)/' "Makefile"
}

pkgver() {
  cd "minimap2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "minimap2"

  make
}

package() {
  cd "minimap2"

  install -Dm755 "minimap2" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/minimap2"
}
