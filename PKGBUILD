# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=cppitertools
pkgver=2.1
pkgrel=1
pkgdesc="Python itertools and builtin iteration functions for C++17"
arch=("any")
url="https://github.com/ryanhaining/cppitertools"
license=('BSD')
depends=('bash')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7bcd4531e37083609bb92c3f0ae03b56e7197002d0dc9c695104dcef445f2ab')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake ../"$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 ../$pkgname-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
