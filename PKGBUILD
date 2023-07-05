# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

_py="python2"
_pkg="sympy"
_pkgname="${_py}-${_pkg}"
pkgname="${_pkgname}1.1"
pkgver=1.1.1
pkgrel=1
arch=(
  'any'
)
_pkgdesc=('Symbolic manipulation package (Computer Algebra System), '
          'written in pure Python')
pkgdesc="${_pkgdesc[*]}"
url="https://${_pkg}.org/en/index.html"
_url="https://github.com/${_pkg}/${_pkg}"
license=('BSD')
depends=(
  "${_py}-mpmath"
)
optdepends=(
  "i${_py}: user friendly interface for isympy"
  "${_py}-symengine: optimized backend, set USE_SYMENGINE=1 to use"
)
makedepends=(
  "${_py}-setuptools"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_url}/archive/${_pkg}-${pkgver}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  'c571a5c6fd0abb59e60baec0f9c7b909ec2d133db52353c58288f7477ac2bc905219b308122761e41509d4bbdfc145375bdc6f76f608eb557e44163bb37b111a'
)

build() {
  cd "${_pkg}-${_pkg}-${pkgver}"
  "${_py}" setup.py build
}

check() {
  cd "${_pkg}-${_pkg}-${pkgver}"
  "${_py}" bin/test
}

package() {
  cd "${_pkg}-${_pkg}-${pkgver}"

  "${_py}" setup.py install --root "${pkgdir}" \
                            --optimize=1

  mv "${pkgdir}/usr/bin/i${_pkg}"{,2}
  mv "${pkgdir}/usr/share/man/man1/i${_pkg}"{,2}.1

  install -D -m644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
