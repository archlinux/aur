# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="Intel SPMD program compiler"
arch=('x86_64')
url="https://ispc.github.io/"
license=('BSD')
depends=('glibc')
optdepends=('intel-compute-runtime: for targeting GPU'
            'level-zero-loader: for targeting GPU'
            'openmp: for targeting GPU')
provides=("ispc=$pkgver")
conflicts=('ispc')
source_x86_64=("ispc-v$pkgver-linux.tar.gz::https://github.com/ispc/ispc/releases/download/v$pkgver/ispc-v$pkgver-linux.tar.gz")
sha256sums_x86_64=('f99a0afd4c8b5e8aceb46af8e90a7ba0813bf4c4111044ced27d498591304f9c')


package() {
  cd "ispc-v$pkgver-linux"

  install -Dm755 "bin/ispc" -t "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/doc/ispc"
  mv *.html "$pkgdir/usr/share/doc/ispc"
  mv "css" "$pkgdir/usr/share/doc/ispc"
  mv "examples" "$pkgdir/usr/share/doc/ispc"
  install -Dm644 "ReleaseNotes.txt" -t "$pkgdir/usr/share/doc/ispc"

  install -Dm644 "contrib/ispc.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"

  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/ispc"
}
