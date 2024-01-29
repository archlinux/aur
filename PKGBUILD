# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Contributor: Alexander Diana <alexander@rouk.org>

_pkg="bcrypt"
_py="python2"
pkgname="${_py}-${_pkg}"
pkgver=3.1.7
pkgrel=4
_pkgdesc=(
  "Modern password hashing for"
  "your software and your servers"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'armv6l'
  'armv7h'
  'aarch64'
  'mips'
  'powerpc'
)
_ns='pyca'
url="https://github.com/${_ns}/${_pkg}"
license=(
  'Apache'
)
depends=(
  'python2-cffi'
  'python2-six'
)
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  'python2-pytest'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha512sums=(
  'bfe487ac43aa5081a16c7f67787c2aec777a9c42f3f0f64d4dd238e6cf135e248e806a675ecdc5240066e2b5a31773f9c5dd939479e96ec25357e27bced01409'
)

build() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${_pkg}-${pkgver}"
  PYTHONPATH="$PWD/build/lib.linux-${CARCH}-2.7" \
    pytest2
}

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="$pkgdir"
}

# vim:set sw=2 sts=-1 et:
