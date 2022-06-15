# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-nestedtext'
_pkgname=${pkgname#python-}
pkgver=3.4
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
  '18b6e23cb732ad920e162b4e0a4c53b422e31b99010cb3f8c015d0e0e1e4d956'
)
sha512sums=(
  'be09071fdbf7124d269284d05beceac4f6d1e08c14941f777c1ac7f33f2a513fb01275d20f6dfb3a3f85df22a6a2ac14443033526b56cc9124de4edb2e9d10fc'
)
b2sums=(
  '4a8e4596130f0e7e6dbd32117ae41b8c0489c75ef48c17df91b389584b4d5327a08a9a2b576aefb79f3b3578057acb3b13d5a3f7986dddd22abff77989b0f2f4'
)

# eof
