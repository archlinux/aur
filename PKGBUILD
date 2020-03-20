# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>
# Comaintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

pkgname=boolector
pkgver=3.2.0
pkgrel=1
pkgdesc="Boolector is an efficient SMT solver for the quantifier-free theory of bit-vectors in combination with the quantifier-free extensional theory of arrays."
arch=('i686' 'x86_64')
url="http://boolector.github.io/"
license=('MIT')
depends=("btor2tools-unstable-git")
makedepends=("make" "cmake" "git")
conflicts=("boolector-git")

source=("https://github.com/Boolector/boolector/archive/3.2.0.tar.gz")
sha256sums=('SKIP')
sha512sums=('SKIP')

build() {
  cd "$srcdir/boolector-3.2.0"

  # Setup lingeling
  ./contrib/setup-lingeling.sh

  # Build Boolector
  CFLAGS="" ./configure.sh --shared
  cd build
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include/boolector"

  cd "$srcdir/boolector-3.2.0/src"
  find . -name "*.h" -exec install -D -m644 {} "$pkgdir/usr/include/boolector/{}" \;

  cd "$srcdir/boolector-3.2.0"
  find . -name "*.so" -exec install -m755 {} "$pkgdir/usr/lib/" \;

  cd "$srcdir/boolector-3.2.0/build/bin"
  find . -name "b*"  -exec install -D -m755 {} "$pkgdir/usr/bin/{}" \;
}
