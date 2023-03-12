# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-jetforce'
_pkgname=${pkgname##python-}
pkgver=0.9.1
pkgrel=6
pkgdesc='An experimental Gemini server written in Python'
arch=('any')
license=('custom:Floodgap')
url='https://github.com/michael-lazar/jetforce'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
depends=(
  'python-dataclasses'
  'python-twisted'
  'python-pyopenssl'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=('jetforce')
conflicts=('jetforce')

build() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || exit 1

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for fname in {CHANGELOG,README}.md; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done
}

sha256sums=(
  '5fde3f231212810de31adf77718b26aa19788b5ec115becddd38356082e4946b'
)
sha512sums=(
  'f0d8e49c71f7730c83c6f29c07cb0e4c5488325dbca81c46acb1fc6ecb8ec946332c8d76f07b86ee1a58560a568ef7500d581e2ec186f9877013e88528dd7dc3'
)
b2sums=(
  'e74b200a00f2d3651a8d38c0ea5435437cf9646f19ae4e24192208d82e9e6ae3b781cf6571c048c519cfd9cc6a32c9b509b6519bd22c2d62e8968881269b153e'
)

# eof
