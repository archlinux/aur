# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.2.6
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')
url='https://github.com/erezsh/runtype'
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
depends=('python')
makedepends=(
  'python-recommonmark'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx-markdown-tables'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
  make -C docs man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in CHANGES.md README.md; do
    install -Dm0644 "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done

  install -Dm0644 docs/_build/man/runtype.7 "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

sha256sums=(
  '2a7410138c7656e413473ebf9abe2d3834127ef021d2b86ffb78ca82aa4ea225'
)
sha512sums=(
  '33a67417dbe4d85e4ba017a897b38ff7c830c243092bfe354f69aa6018acaf5d8bc4504b2e04a6eac662675db4012f71bab43bbf557c596581205f8e8ef1ed36'
)
b2sums=(
  'dc3b1b51f92919317b4ed3b6eb265642395b36309f33c95999168ab8dbef9eebaab8588a19befafec71b538f1d67955f74bb2076a862a32a44503f33bac70281'
)

# eof
