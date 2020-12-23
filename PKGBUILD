# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=10.0.0
_noise="db901f7f7084025abc3cbb9d17b0f2d3f1745900"
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc')
source_i686=("https://github.com/halide/Halide/releases/download/v$pkgver/Halide-$pkgver-x86-32-linux-$_noise.tar.gz")
source_x86_64=("https://github.com/halide/Halide/releases/download/v$pkgver/Halide-$pkgver-x86-64-linux-$_noise.tar.gz")
source_armv7h=("https://github.com/halide/Halide/releases/download/v$pkgver/Halide-$pkgver-arm-32-linux-$_noise.tar.gz")
source_aarch64=("https://github.com/halide/Halide/releases/download/v$pkgver/Halide-$pkgver-arm-64-linux-$_noise.tar.gz")
md5sums_i686=('4878da22453309537ebc63a12500eabb')
md5sums_x86_64=('a22ef3f2d639de9927cdba5fdaf05ead')
md5sums_armv7h=('fccba2818824f42e0e60d9df135034a5')
md5sums_aarch64=('dafab3cf71741223c630291c119828d4')
if [[ "$CARCH" == "i686" ]];    then _tar_arch='x86-32'; fi
if [[ "$CARCH" == "x86_64" ]];  then _tar_arch='x86-64'; fi
if [[ "$CARCH" == "armv7h" ]];  then _tar_arch='arm-32'; fi
if [[ "$CARCH" == "aarch64" ]]; then _tar_arch='arm-64'; fi

package() {
  cd "$srcdir/Halide-$pkgver-$_tar_arch-linux"
  for i in bin/*; do
    install -Dm755 $i "$pkgdir/usr/$i"
  done
  for i in lib/lib*; do
    install -Dm755 $i "$pkgdir/usr/$i"
  done
  for i in include/*.h; do
    install -Dm644 $i "$pkgdir/usr/$i"
  done
}
