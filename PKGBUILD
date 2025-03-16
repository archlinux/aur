# Maintainer: Locotir <magazo2005@gmail.com>

pkgname=c-lcrypt
pkgver=4.0.0
pkgrel=1
pkgdesc="C++ encryption program with RAM-based I/O, featuring byte shuffling, binary reversal, bit insertion, byte substitution with randomized table, and XOR key encryption for secure file/folder handling."
arch=('x86_64')
url="https://github.com/Locotir/C-LCRYPT"
license=('MIT')
depends=('gcc')
makedepends=('git')

# Download release version
source=("https://github.com/Locotir/C-LCRYPT/archive/refs/tags/v$pkgver.tar.gz")

# Github -> Skip
sha256sums=('SKIP') 

validpgpkeys=()

build() {
  cd "$srcdir/C-LCRYPT-$pkgver"  # El directorio cambia al extraer el tar.gz
  g++ -std=c++17 -O3 -march=native -mtune=native -pipe -flto=$(nproc) -funroll-loops -fomit-frame-pointer -fno-plt -ffast-math \
      -o C-LCRYPT C-LCRYPT.cpp -fopenmp
}

package() {
  cd "$srcdir/C-LCRYPT-$pkgver"
  install -Dm755 C-LCRYPT "$pkgdir/usr/bin/c-lcrypt"
}
