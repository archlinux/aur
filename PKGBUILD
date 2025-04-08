# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-libipld-git'
_pkgname="${pkgname/-git/}"
pkgver=3.0.1.r0.ga3b2a64
pkgrel=3
pkgdesc='Fast Python library to work with IPLD: CAR, CID, DAG-CBOR, DAG-JSON, DAG-PB, multibase (built from latest git commit)'
arch=('x86_64')
url='https://github.com/MarshalX/python-libipld'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
depends=(
  'gcc-libs'
  'glibc'
  'python'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provies[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# eof
