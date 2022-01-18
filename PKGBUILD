# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-nestedtext'
_pkgname=${pkgname#python-}
pkgver=3.2
pkgrel=1
pkgdesc='Human readable and writable data interchange format'
arch=('any')
license=('MIT')
url='https://github.com/KenKundert/nestedtext'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
depends=('python')
makedepends=(
  'python-inform'
  'python-setuptools'
  'python-sphinx'
)
sha256sums=(
  '5f2f2e9e215b10aff09d7703aea086c4bd5ee0b0e71a11d47d77e25375e4acc5'
)
sha512sums=(
  '1879ba6d2d01d8f5fe9ba4dd2aaba65601e2a4a701780ee740e6fd48c8a89620848da250e6bd0dfb6b92c77c27cf17c88e53cc0e18ffed47ef0c47d5a36d862d'
)
b2sums=(
  '5933aa5276728511336c37fec5ee3384df81a10151a9145d463c12b0511229109f5479e06ec9f3dc8370047142b907823bcc2be1dd2faf6052a72f6a61f93334'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build

  install -Dm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"

  cd "$srcdir/$_pkgname-$pkgver/doc" || exit 1

  for fname in Makefile *.*; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done
}

# eof
