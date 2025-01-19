# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='isd-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.2.0.r0.g44bfbe7
pkgrel=1
pkgdesc='Interactive TUI for systemd units (latest commit)'
arch=('any')
url='https://github.com/isd-project/isd'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'python>=3.12'
  'python-pfzy>=0.3.4'
  'python-pydantic-settings>=2.7.0'
  'python-textual>=0.89.1'
  'python-xdg-base-dirs>=6.0.0'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# eof
