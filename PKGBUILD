# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=c2nim
pkgver=0.9.19
pkgrel=1
pkgdesc="A tool to translate Ansi C code to Nim"
arch=(i686 x86_64)
depends=(glibc)
optdepends=('nim: to compile generated Nim code')
makedepends=(git nim nimble)
groups=(nim)
url="https://github.com/nim-lang/c2nim"
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nim-lang/c2nim/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f63f99e684d62722b912c6bcf470d7ae7d32a92f6f11c356325ba2a1d916b90d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  echo 'Building...'
  nimble build -y
  # nim rst2html is currently broken:
  # https://github.com/nim-lang/Nim/issues/14424
  # nimble docs
}

check()  {
  cd "$srcdir/$pkgname-$pkgver"

  echo 'Running tests...'
  nimble test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  echo 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 doc/c2nim.rst -t "$pkgdir/usr/share/doc/$pkgname/doc"

  echo 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"

  echo 'Installing binary...'
  install -Dm 755 c2nim -t "$pkgdir/usr/bin"
}
