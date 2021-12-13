# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-runtype'
_pkgname=${pkgname#python-}
pkgver=0.2.4
pkgrel=3
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
md5sums=(
  '9ee6bc875a5c0e7e3fe7936f1b65745e'
)
sha1sums=(
  '1447316075323cc2093ab3baf7b7bf35752c4b33'
)
sha256sums=(
  '4d9b1d5c29aa1f372fe96cae03cfb85fe30f51bda8dd1658b0581e539ee08a7f'
)
sha512sums=(
  '6a0da395b316c0a30d36f12a31a6a6f62e1e58a34cc04a4fa2515bd57c21a339eecd1bcd188f0ddf5013a2c3636f7e433765f501b9772235e426f29acf9482b1'
)
b2sums=(
  'e0038ec9d002271ec7e018d78c9a7f0a265bd733d144dcdb0838e75ec7d015d28f1f8bc452c5b9f2e6406a6778564d4da94db8d945da0be73bb188a4ebd9b3e5'
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

# eof
