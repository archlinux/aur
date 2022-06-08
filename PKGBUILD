# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-nestedtext'
_pkgname=${pkgname#python-}
pkgver=3.3
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

sha256sums=(
  'f2591fdddc6ddc83e861812e1727417f06e2e13468f35cd510f5de994e1da8ce'
)
sha512sums=(
  '2b478793e83b66a420261aad1b1e7e5c18c36d1957882cac1de4951c007c9760766f1df6605f6a30f935a42766f7dac7d7a41db9516ed8d7ee4187fab842f503'
)
b2sums=(
  '6fa88f8dede653abb42db420e563ba6efe019aa5bdffc2c777999e6215f337410686522c8b7185a955541532de0a10da0a4647aebceb816ccae1435b5bcc5085'
)

# eof
