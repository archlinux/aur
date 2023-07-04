# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Omar Sandoval <osandov at cs dot washington dot edu>
# Contributor: Alexander Slesarev <slesarew at gmail dot com>

_py="python2"
_pk="gmpy"
_pkg="${_pk}2"
pkgname="${_py}-${_pkg}"
pkgver=2.1.5
pkgrel=2
_pkgdesc=('Provides C-coded Python modules for fast '
          'multiple-precision arithmetic')
pkgdesc="${_pkgdesc[*]}"
_ns="aleaxit"
url="https://github.com/${_ns}/${_pk}"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  armv6l
)
license=(LGPL2.1)
depends=(
  "${_py}"
  libmpc
)
makedepends=(
  # "${_py}-build"
  # "${_py}-installer"
  "${_py}-setuptools"
  "${_py}-wheel"
)
source=(
  "${url}/archive/refs/tags/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '67ef729ff8e7f501e3f23324058386bac3fe0dea9b460317b27bde579c7cfbd5'
)

build() {
  cd "${_pk}-${_pkg}-${pkgver}"
  # "${_py}" -m build --wheel --no-isolation
  "${_py}" setup.py build
}

package() {
  cd "${_pk}-${_pkg}-${pkgver}"
  # python -m installer --destdir="$pkgdir" dist/*.whl
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1
 
  install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
                    "docs/"*
}
