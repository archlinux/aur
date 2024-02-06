# SPDX-License-Identifier: AGPL-3.0
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

# shellcheck disable=SC2034
_py="python2"
_pkg="distlib"
pkgbase="${_py}-${_pkg}"
pkgname=(
  "${pkgbase}"
)
pkgver=0.3.3
pkgrel=1
pkgdesc="Low-level components of distutils2/packaging"
arch=(
  'any'
)
_http="https://bitbucket.org"
_ns="pypa"
url="${_http}/${_ns}/${_name}"
license=(
  'PSF'
)
makedepends=(
  "${_py}"
)
_pypi="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi}/${_pkg:0:1}/${_pkg}/${_pkg}-${pkgver}.zip"
)
sha256sums=(
  'd982d0751ff6eaaab5e2ec8e691d949ee80eddf01a62eaa96ddb11531fe16b05'
)
b2sums=(
  '269ec9e8f22c991fea6b81c37d9b527348bd5431fe09b02a7972e3272c379842df0254ae0c9e7283bc1b5a2402d9bd9087e2d1fdd979c1ac3a8b99cfb962c308'
)

# shellcheck disable=SC2154
prepare() {
  cd \
    "${srcdir}"/${_pkg}-${pkgver} || \
    exit
  rm \
    distlib/*.exe
}

# shellcheck disable=SC2154
build() {
  cd \
    "${srcdir}/${_name}-${pkgver}" || \
    exit
  "${_py}" \
    setup.py \
      build
}

# shellcheck disable=SC2154
check() {
  cd \
    "${srcdir}"/${_pkg}-${pkgver} || \
    exit
  "${_py}" \
    setup.py \
      test
}

# shellcheck disable=SC2154
package() {
  depends=(
    "${_py}"
  )
  cd \
    "${srcdir}/${_pkg}-${pkgver}" || \
    exit
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1 \
	--skip-build
}

# vim:set sw=2 sts=-1 et:
