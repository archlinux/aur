# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')
url='https://github.com/erezsh/runtype'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
depends=(
  'python'
  'python-typing_extensions'
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
  'ef3be572d3c704b23c18a2e30902299588383666e952f2bd5e084eaa5f40bb4f'
)
b2sums=(
  '28797507e7785dbe54bf31bfd492bc4d39cc0484600ec661a5cc8a777aba773a93cded39b6b851c0fb440f1afd52f98761350eba3da3ab5df82c9d86f6e21dc0'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 23rd October
#
# There are no higher or lower states.
#
# There is only the state you are in.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
