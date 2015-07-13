# Afl arch package, modified by David Mazieres

pkgname=afl_llvm_mode
pkgver=1.83b
pkgrel=1
pkgdesc='clang-specific afl-clang-fast tool not in afl package'
arch=('i686' 'x86_64')
url="http://lcamtuf.coredump.cx/afl/"
license=('Apache')
depends=('glibc' 'bash' "afl=$pkgver" 'clang')
optdepends=(
  'gcc: gcc instrumentation support'
  'clang: clang instrumentation support'
)
options=('!emptydirs' '!strip')
source=(afl-${pkgver}.tgz::http://lcamtuf.coredump.cx/${pkgname}/releases/${pkgname}-${pkgver}.tgz)
sha512sums=('efb9126b89b294ee171b0d4fa7e9e71d2bb55e572a17d9d2c7c83ee613b42fc27f70b75671e7fb1d816bad1a9baaf71c36ba4b05135d39a1644e732d35fe09ec')

build() {
  cd afl-${pkgver}
  make PREFIX=/usr
  make -C llvm_mode PREFIX=/usr
}

package() {
  cd afl-${pkgver}
  install -D -m 755 -t "$pkgdir/usr/lib" afl-llvm-pass.so afl-llvm-rt.o
  install -D -m 755 -t "$pkgdir/usr/bin" afl-clang-fast
  ln -s afl-clang-fast "$pkgdir/usr/bin/afl-clang-fast++"
}

# vim:set ts=2 sw=2 et:
