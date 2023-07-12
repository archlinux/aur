# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=motorola-6800-assembler-git
pkgver=r51.61d4b9b
pkgrel=1
pkgdesc="This is the assembler for the Motorola 6800 family of 8bit microprocessors."
arch=("x86_64")
url="https://github.com/JimInCA/motorola-6800-assembler"
license=("unknown")
source=("git+https://github.com/JimInCA/motorola-6800-assembler.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/motorola-6800-assembler"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/motorola-6800-assembler"

  make clean
  make
}

package() {
  for file in as0 as1 as11 as4 as5 as9; do
    install -Dm 755 "$srcdir/motorola-6800-assembler/bin/$file" "$pkgdir/usr/bin/$file"
  done

  install -Dm 644 "$srcdir/motorola-6800-assembler/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$srcdir/motorola-6800-assembler/documentation/assembler.txt" "$pkgdir/usr/share/doc/$pkgname/assembler.txt"
  install -Dm 644 "$srcdir/motorola-6800-assembler/documentation/motorola_cross_asm_manual.pdf" "$pkgdir/usr/share/doc/$pkgname/motorola_cross_asm_manual.pdf"
}
