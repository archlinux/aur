# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

_py="python2"
_pkg="m2crypto"
pkgname="${_py}-${_pkg}"
pkgver=0.40.1
pkgrel=1
pkgdesc="A crypto and SSL toolkit for Python"
arch=(
  'x86_64'
  'arm'
  'aarch64'
  'i686'
)
url="https://pypi.python.org/pypi/M2Crypto"
license=(
  'BSD'
)
depends=(
  "${_py}"
  'openssl'
)
makedepends=(
  "${_py}-setuptools"
  'swig'
)
_url="https://gitlab.com/${_pkg}/${_pkg}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${_url}/-/archive/${pkgver}/${_pkg}-${pkgver}.tar.gz"
  "LICENSE")
sha256sums=(
  'b5b6610919c43dcb28c34ba3a2d156ec84fbd5e17228349dddbec58f72ca5fd6'
  '4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0')

build(){
  cd "m2crypto-$pkgver"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd "m2crypto-${pkgver}"
  "${_py}" \
   setup.py \
     install \
       --root="${pkgdir}" \
       --optimize=1 \
       --skip-build
  install \
    -D \
    -m644 \
    "$srcdir"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
