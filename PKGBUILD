pkgname=zensh
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal Unix shell written in C"
arch=('x86_64')
url="https://github.com/ChethanJS07/zensh"
license=('MIT')
depends=('readline')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChethanJS07/zensh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('550a272baf476b8291a5a7968c41ecf0c5af10741b7639a50509ccae847affbd')

prepare() {
  # Create build directory
  mkdir -p build
}

build() {
  cmake -S "$srcdir/zensh-$pkgver" \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Install documentation
  install -Dm644 "$srcdir/zensh-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install license
  install -Dm644 "$srcdir/zensh-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install man page
  install -Dm644 "$srcdir/zensh-$pkgver/man/zensh.1" \
    "$pkgdir/usr/share/man/man1/zensh.1"
}
