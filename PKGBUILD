# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=canu
pkgver=2.3
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('i686' 'x86_64')
url="https://canu.readthedocs.io/"
license=('LicenseRef-canu')
depends=('gcc-libs' 'java-runtime' 'perl')
optdepends=('gnuplot')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.xz::https://github.com/marbl/canu/releases/download/v$pkgver/canu-$pkgver.tar.xz")
sha256sums=('ecb071943cde722152deb861d4ab897090f00b227fd0b261592e1e3fdd3e3e1a')


build() {
  cd "$pkgname-$pkgver"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  make -C "src"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "build/bin"/* -t "$pkgdir/usr/bin"
  install -Dm644 "build/lib/site_perl/canu"/*.pm -t "$pkgdir/usr/lib/site_perl/canu"
  install -Dm644 "build/share/java/classes"/*.jar -t "$pkgdir/usr/share/java/classes"
  install -Dm644 "build/lib"/*.a -t "$pkgdir/usr/lib"

  install -Dm644 "README.licenses" -t "$pkgdir/usr/share/licenses/canu"
}
