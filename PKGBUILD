# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (tallero) <pellegrinoprevete at gmail dot com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Oskar Roesler <oskar at oskar-roesler dot de>

_py="python2"
_pkg="cffi"
pkgname="${_py}-${_pkg}"
pkgver=1.15.1
pkgrel=3
pkgdesc="Foreign Function Interface for Python calling C code"
arch=(
  'aarch64'
  'arm'
  'armv6l'
  'armv7h'
  'i686'
  'mips'
  'pentium4'
  'powerpc'
  'x86_64'
)
url="https://${_pkg}.readthedocs.org/"
license=(
  'MIT'
)
depends=(
  "${_py}-pycparser"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi_url="https://pypi.io/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-$pkgver.tar.gz"
)
sha256sums=(
  'd400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9')

build() {
  cd \
    "$srcdir/${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "${_pkg}-$pkgver"

  # remove files created during
  # check() for reproducible SOURCES.txt
  rm \
    -rf \
    testing/"${_pkg}"{0,1}/__pycache__/
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
