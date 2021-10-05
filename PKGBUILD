# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.2.2
pkgrel=2
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
  'd94a4343c3a685f360c30572efb2c8b7'
)
sha1sums=(
  '622ddf3902e666a8148213e3734fb01869d91c39'
)
sha256sums=(
  '597e6ce7071fa757dcbcaa38e7e481dc212b15eeb0aafdbeab28b07a165706b5'
)
sha512sums=(
  '7327a3edbdbc1fc6bc8b6586043bd44c092eb91b8c43a175f4865fb018ae20b3025b19dbce95a16b9bd932e219322c3540ac06b523f0d26f54cb78f141ee22b3'
)
b2sums=(
  '120bba8089477945f06b633450fdda61d85c02b61efef1d0d31887b80e288f98d5dad5af0d736cb979dabbd9d394c6e87e3b0613911dd62f4f9195e695253f34'
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
