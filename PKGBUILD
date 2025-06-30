# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='isd-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
pkgver=0.5.1.r2.gd7fa6f9
pkgrel=2
pkgdesc='Interactive TUI for systemd units (latest commit)'
arch=('any')
url='https://github.com/isd-project/isd'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'hicolor-icon-theme'  # needed for hicolor theme hierarchy
  'python>=3.11'
  'python-pfzy'
  'python-pydantic-settings'
  'python-textual'
  'python-types-pyyaml'
  'python-xdg-base-dirs'
)
source=("git+$url.git")
provides=("$_pkgname"{,-tui})
conflicts=("${provides[@]}")
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
