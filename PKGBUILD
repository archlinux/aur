# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-jetforce'
_pkgname=${pkgname##python-}
pkgver=0.10.0
pkgrel=1
pkgdesc='An experimental Gemini server written in Python'
arch=('any')
license=('custom:Floodgap')
url='https://github.com/michael-lazar/jetforce'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
depends=(
  'python'
  'python-cryptography'
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
  '9b0d5a1810810af38aca0511dea8c9096715d2349db357cabbbbc31d327bba4c'
)
b2sums=(
  '68d3b0fc678ffafd74ce39c279753750a15b2bc8f33646f5537e2fa2fa0bfc65a62d1adb5e0ec3155d57f341cd9235317296a91b4c59d132671cff79ee8bcdf2'
)

# eof
