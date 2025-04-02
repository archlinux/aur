# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-textcase-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgver=0.2.0.r24.gc752b23
pkgrel=1
pkgdesc='Feature complete Python text case conversion library (built from latest git commit)'
arch=('any')
url="https://github.com/zobweyt/$_srcname"
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=('python')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CHANGELOG,CONTRIBUTING,README}.md
}

# eof
