# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# shellcheck disable=SC2164,SC2034,SC2154
_pkgauthor=michalc
_pkgname=stream-inflate
_pkgurl="https://github.com/${_pkgauthor}/${_pkgname}"

pkgname=python-${_pkgname}
pkgver=0.0.43
pkgrel=1
_pkgver="v${pkgver}"

pkgdesc="Uncompress Deflate and Deflate64 streams in pure Python (albeit compiled with Cython"
url="${_pkgurl}"

arch=('x86_64')
license=('MIT')

depends=(
  'glibc'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-coverage>=7'
  'python-pytest>=8.3'
  'python-pytest-cov>=5'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${_pkgurl}/archive/${_pkgver}.tar.gz"
)

sha256sums=('2ce2de0fee73d17da6ed722c855dc7717d2fd7292741d70ea32e55cb0641bbfa')

# @NOTE: These tests take roughly ~20 minutes to run on the maintainer's
# workstation, as there are 1956 cases (with all permutations of parameters)
# being tested. This function will remain disabled until upstream provides a way
# to run tests for the most common usage of the software.
# check() {
#  cd "${_pkgname}-${pkgver}"
#  python -m pytest
#}

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CONTRIBUTING.md
}
