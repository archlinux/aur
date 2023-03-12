# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=3
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')
url='https://github.com/erezsh/runtype'
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
depends=(
  'mypy'
  'python-dataclasses'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-recommonmark'
  'python-sphinx'
  'python-sphinx-markdown-tables'
  'python-wheel'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m build --wheel --no-isolation
  make -C docs man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in {CHANGES,README}.md; do
    install -Dm0644 "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done

  install -Dm0644 docs/_build/man/runtype.7 "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

sha256sums=(
  '451abd8830588558e4ff7c699dbb987e251cdc78a75267304923a938eac3c97d'
)
sha512sums=(
  '61c79f6e7b1a4c34d3a56cd5933ed944d2b23bc22c2436897733c5d217a354555e7ad483d939129b99bd4f6718e3836035288d110f74ac341bb7907cbd1593de'
)
b2sums=(
  '420c6c49c1d228ad1d2870eaeb2ea14f1898a319e534dbe80b9b03eebc6200de5ff329e0597d7ee68ce63a792e3007802b3603813b37f68542499be6f75c7c87'
)

# eof
