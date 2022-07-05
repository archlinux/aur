# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.2.7
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
  'd8270e9fada718397bd7c8fc3f73656c6c793bc28b732ce7d2cf40c2bc16d4f9'
)
sha512sums=(
  '2891da828a569e760e342acc0bdfc0dd6c87f8ba260cb98ba985ea22692dc93453fd5f3e3e6b7494ea8094da3f9ad715987a2934bd372a212f7c671f370b37f7'
)
b2sums=(
  'fc4962f31a5515247ac62c9a461792ead599f25ba2aaf4cf48183ed5d2fa477189f754385db70ea8ea077d5e3034f4417517ca4d89f390f08991faa057cb5bc2'
)

# eof
