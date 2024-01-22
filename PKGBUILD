# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname='python-ansi'
_pkgname='ansi'
pkgver=0.3.7
pkgrel=1
pkgdesc='ANSI cursor movement and graphics'
arch=('any')
url='https://github.com/tehmaze/ansi'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=(
  'python'
  'python-typing_extensions'
)
makedepends=(
  'python-installer'
  'python-wheel'
)
_wheel="${_pkgname}-$pkgver-py3-none-any.whl"
noextract=("$_wheel")
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$_wheel"
)
# *sums taken from PyPI (blake2 is truncated, and thus invalid here)
md5sums=(
  'aa4830b46aae034f2a1db25b1239beef'
)
sha256sums=(
  'bdd9e3c2dc3e4c8df8c2b745ca6f07f715aa4edee5ed4a5bcb29065da06a3f71'
)

package() {
  umask 0022
  python -m installer --destdir="$pkgdir" "$_wheel"

  install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr $pkgdir/usr/lib/python*/site-packages/$_pkgname-*.dist-info/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}

# eof
