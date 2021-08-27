# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=canu
pkgver=2.2
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('i686' 'x86_64')
url="https://canu.readthedocs.io/"
license=('custom')
depends=('glibc' 'java-runtime' 'perl')
optdepends=('gnuplot')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.xz::https://github.com/marbl/canu/releases/download/v$pkgver/canu-$pkgver.tar.xz")
sha256sums=('e4d0c7b82149114f442ccd39e18f7fe2061c63b28d53700ad896e022b73b7404')


build() {
  cd "$pkgname-$pkgver"

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
