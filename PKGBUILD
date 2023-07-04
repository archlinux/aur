# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

_py="python2"
_pkg="sympy"
pkgname="${_py}-${_pkg}"
pkgver=1.5
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
  "${_py}-setuptools")
source=(
  "${_url}/archive/${_pkg}-${pkgver}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '6d205c61e3ee651c46408746c32af30336ae26b6bbbf49a304f1228149d0de0cbe6ec41b5cc55b0edc163b0e0e6e4db88d19216d29ad5c8e366e6f45ba81b45e'
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
