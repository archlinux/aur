# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-wassima-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname/-/.}"
pkgver=2.0.0.r0.ge45e965
pkgrel=2
pkgdesc='Say goodbye to certifi. Embrace your system root CAs — retrieve them with ease and comfort (latest commit)'
arch=('any')
url='https://github.com/jawah/wassima'
license=('MIT')  # SPDX-License-Identifier: MIT
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=('python>=3.7')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  |  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CHANGELOG,README,SECURITY}.md NOTICE
}

# eof
