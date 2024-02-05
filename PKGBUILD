# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Timm Preetz <timm@preetz.us>

_py="python2"
_pkg="pygments"
_name="Pygments"
pkgname="${_py}-${_pkg}"
pkgver=2.5.2
pkgrel=2
pkgdesc="Python syntax highlighter"
arch=(
  'any'
)
url="https://${_pkg}.org/"
license=(
  'BSD'
)
depends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.org/packages/source"
source=(
  "${_pypi}/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '98c8aa5a9f778fcd1026a17361ddaf7330d1b7c62ae97c3bb0ae73e0b9b6b0fe'
)

package() {
  cd \
    "${srcdir}/${_name}-${pkgver}"

  "${_py}" \
    setup.py \
    install \
    --root="${pkgdir}" \
    -O1
  install \
    -Dm644 \
    LICENSE \
    -t \
      "${pkgdir}/usr/share/licenses/${pkgname}"

  # pygmentize is included in python-pygments
  find \
    "${pkgdir}" | \
    grep \
      "bin"
  cd \
    "${pkgdir}/usr/bin"
  mv \
    "pygmentize" \
    "pygmentize2"
}

# vim:set ts=2 sw=2 et:
