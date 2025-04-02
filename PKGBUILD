# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-urllib3-future-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=2.12.915.r0.g60af644f
pkgrel=2
pkgdesc='Powerful HTTP 1.1, 2, and 3 client with both sync and async interfaces (built from latest git commit)'
arch=('any')
url='https://github.com/jawah/urllib3.future'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'python'
  'python-brotli'
  'python-h11'
  'python-idna'
  'python-jh2'
  'python-pyopenssl'
  'python-pysocks'
  'python-python-socks'
  'python-qh3'
  'python-typing_extensions'
  'python-wsproto'
  'python-zstandard'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --tags --long \
  |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  # We do not wish to conflict with the original python-urllib3
  env URLLIB3_NO_OVERRIDE=true python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -vDm0644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
