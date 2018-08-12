# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=fcode-utils
pkgver=1.0.2
pkgrel=1
pkgdesc="Utilities to process FCODE, OpenFirmware's byte code"
arch=(i686 x86_64)
url=https://www.openfirmware.info/FCODE_suite
license=(GPL2)
depends=(glibc)
provides=(romheaders)
conflicts=(fcode-utils-git)
source=(https://github.com/openbios/fcode-utils/archive/v$pkgver.tar.gz
        fix-flags.patch)
sha512sums=('103ae55c694d6d9bff41ff951d553ca221a74be6f334dc36f9de4310f7c71d663f8d73e7c8c80932a0a39f3e9cab4976cf1382a35d13267b3c61cdac2ba4f4f1'
            '0c37274bfa4cd37761eefc0fdd510e3935e653ba1828ece942651b03526960fc848d1a7b98259a1c1fe7cf85a8068aee46c848758a4225146c51599b6d7ee305')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fix-flags.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -D detok/detok romheaders/romheaders toke/toke -t "$pkgdir"/usr/bin
  install -Dm 644 README -t "$pkgdir"/usr/share/doc/fcode-utils
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/fcode-utils/LICENSE
}
