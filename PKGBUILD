# Maintainer: Locotir <magazo2005@gmail.com>

pkgname=c-lcrypt
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ encryption program with RAM-based I/O, featuring byte shuffling, binary reversal, bit insertion, byte substitution with randomized table, and XOR key encryption for secure file handling."
arch=('x86_64')
url="https://github.com/Locotir/C-LCRYPT"
license=('MIT')
depends=('gcc' 'openssl' 'boost' 'zlib' 'zstd' 'libsodium')
makedepends=('git' 'tar')
_tag=$(git rev-parse "v$pkgver")
source=("git+https://github.com/Locotir/C-LCRYPT.git#tag=v$pkgver")
sha256sums=('SKIP') # Github repo
validpgpkeys=()

build() {
  cd "$srcdir/C-LCRYPT"  # Cambiado de C-LCRYPT-$pkgver a C-LCRYPT
  g++ -O3 -march=native -mtune=native -pipe -flto -funroll-loops -fomit-frame-pointer -fno-plt -ffast-math \
      -o C-LCRYPT C-LCRYPT.cpp -lssl -lcrypto -lz -lboost_iostreams -lzstd -lsodium
}

package() {
  cd "$srcdir/C-LCRYPT"  # Cambiado de C-LCRYPT-$pkgver a C-LCRYPT
  install -Dm755 C-LCRYPT "$pkgdir/usr/bin/c-lcrypt"
}
