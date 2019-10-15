# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>

_pkgname=chakracore
pkgname=chakracore-bin
pkgver=1.11.14
pkgrel=1
pkgdesc='ChakraCore is the core part of the Chakra Javascript engine that powers Microsoft Edge. This is the pre-built binaries from Microsoft.'
arch=('x86_64')
url='https://github.com/Microsoft/ChakraCore'
license=('MIT')
provides=('libChakraCore.so' 'ch')
conflicts=('chakracore-git' 'chakracore')
source=("$pkgname-$pkgver-linux-$arch.tar.gz::https://aka.ms/chakracore/cc_linux_x64_1_11_14")
sha256sums=('477ddc0625381de43298924373ad60c580c0e6da53d57ecd579195e13a49071b')

_dir="ChakraCoreFiles"

package() {
  install -Dm755 "$srcdir/$_dir/bin/ch" "$pkgdir/usr/bin/ch"

  install -Dm644 "$srcdir/$_dir/lib/libChakraCore.so" "$pkgdir/usr/lib/libChakraCore.so"

  for file in $srcdir/$_dir/include/*; do
    install -Dm644 "$file" "$pkgdir/usr/include/$(basename $file)"
  done

  install -Dm644 "$srcdir/$_dir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
