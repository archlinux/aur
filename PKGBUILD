# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-jetforce'
_pkgname="${pkgname/python-}"
pkgver=0.10.1
pkgrel=3
pkgdesc='Experimental Gemini server written in Python'
arch=('any')
license=('LicenseRef-Floodgap')  # SPDX-License-Identifier: LicenseRef-Floodgap
url='https://github.com/michael-lazar/jetforce'
source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
depends=(
  'python'
  'python-cryptography'
  'python-pyopenssl'
  'python-twisted'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=('jetforce')
conflicts=('jetforce')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README}.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
}

sha256sums=(
  'b6e4961cf2b3d1ae9d11b8a66cd7f3b7fd04db263cba38d6150af42fa8175dc8'
)
b2sums=(
  '36eafdd2bcc1661817da147cfb6699c214e079109d894f0588ad872d68d4663af515a7d99fe60f7923a72195d06db1ed846a2f4c4e8155f164a4d8349a26d04f'
)

# eof
