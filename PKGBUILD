# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc='Python utilities for run-time type validation and multiple dispatch'
arch=('any')
license=('MIT')
url='https://github.com/erezsh/runtype'
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
depends=('python')
makedepends=(
  'python-sphinx'
  'python-recommonmark'
  'python-sphinx-markdown-tables'
)
md5sums=(
  '83e16f80662bf0a1490a05cdcc422f34'
)
sha1sums=(
  '003e9fe449e439f513d9e9a2deebfa134d7a826f'
)
sha256sums=(
  '96a5ff7729150678b4cb8161b203fda983babe226ea215e2d096ecbc67ba4f68'
)
sha512sums=(
  '75d4cbb329c3db5f90ecd900664756c1067247c9a2f5dabcc2705c1d29d81c0a11632a4a35f9acd769414712c9219ff8fa4888925e49daf6285d6cb6de2351c0'
)
b2sums=(
  'db01ad896c1ff136575633d3467ef88325d7550cf8167c302f0573d8156a71f8af40578db52ce7ad378d8a8db263ea2eede9e1fd60884183f365391c79b0c43b'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py build
  make -C docs man
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for mdfile in CHANGES.md README.md; do
    install -Dm0644 "$mdfile" "$pkgdir/usr/share/doc/$pkgname/$mdfile"
  done

  install -Dm0644 docs/_build/man/runtype.7 "$pkgdir/usr/share/man/man7/${pkgname}.7"
}

# eof
