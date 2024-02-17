# Maintainer: hossbeast <todd DOT freed AT gmail DOT com>

pkgname=bam-build
pkgver=0.8.1
pkgrel=1
pkgdesc="build optimally"
arch=('x86_64')
url="https://git.sr.ht/~hossbeast/bam"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'perl')
makedepends=('git')
source=(
  "bam::git+https://git.sr.ht/~hossbeast/bam#tag=v${pkgver}?signed"
)
sha512sums=('SKIP')
validpgpkeys=('79154EE9C4811D32B814EB88B1B3C76D76638462') # hossbeast

build() {
  mkdir -p build
  cd build
  ../bam/configure
  make
}

package() {
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bam/bam"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bamd/bamd"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bacon/bacon"

  install -m755 -d "$pkgdir/usr/share/bam"
  install -m755 -d "$pkgdir/usr/share/bam/doc"
  install -m644 -t "$pkgdir/usr/share/bam/doc" "$srcdir/bam/README.md"
  install -m644 -t "$pkgdir/usr/share/bam/doc" "$srcdir/bam/CHANGELOG"

  install -m755 -d "$pkgdir/usr/share/bam/config"
  install -m644 -t "$pkgdir/usr/share/bam/config" "$srcdir/bam/etc/config.bam"
  install -m644 -t "$pkgdir/usr/share/bam/config" "$srcdir/bam/etc/bam/client_config"

  install -m755 -d "$pkgdir/usr/share/bam/modules"
  rm -rf  "$pkgdir/usr/share/bam/modules/*"
  cp -dR "$srcdir/bam/builtin-modules" "$pkgdir/usr/share/bam/modules"

  install -m755 -d "$pkgdir/usr/share/licenses/bam"
  install -m644 -t "$pkgdir/usr/share/licenses/bam" "$srcdir/bam/LICENSE"
}
