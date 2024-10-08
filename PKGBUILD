# Maintainer: Ivaylo Bachvarov <ISBachvarov21@codingburgas.bg>
pkgname=rune-cpp-git
pkgver=0.1
pkgrel=1
pkgdesc="A C++ framework for developing REST APIs with a focus on simplicity and speed."
arch=(x86_64 i686)
url="https://github.com/ISBachvarov21/Rune"
license=('MIT')
makedepends=('git' 'gcc' 'cmake')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')  # Git repositories do not need checksums

pkgver() {
  cd "$srcdir/$pkgname"
  # Dynamically generate the version using commit count and short hash
  echo "0.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cmake -S . -B build
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  cmake --install build --prefix "$pkgdir/usr"
}
