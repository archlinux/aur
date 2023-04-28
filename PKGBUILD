# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
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
  'd45d332e2e127660e4efb4d34ec72d087fd78cdfba6bf2a53da3afcccee71a21'
)
sha512sums=(
  'd67616b86b6607585841fd4181f1c26dd19248baf2c2726290ba0f0c0a28622761bafac49e640c66a2bc29ba15c3f7193bd7de9cca1045858c29d40de06674cc'
)
b2sums=(
  '07750cb177755e02b8c6f698bfb9f7f01c02ec1d8ebb4021e6a3fe447c1bb9a49488780b6b0a0b5fb24d0e4d8f9c8fb9605f555fe3183fe85409bd640833c701'
)

# eof
