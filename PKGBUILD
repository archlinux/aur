# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Oskar Roesler <oskar at oskar-roesler dot de>

_py="python2"
_pkg="asn1crypto"
pkgname="${_py}-${_pkg}"
pkgver=1.5.1
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Python ASN.1 library with a focus on performance and a python2ic API"
url="https://github.com/wbond/${_pkg}"
depends=("${_py}")
makedepends=("${_py}-setuptools")
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=(
  '1bcb93d82a2602e3b5c66a180f5d16cd3a9731d86d89fbd44c1e23d735e708e9bf9bb6cbabc2a5d60619f51a7c38dfb1f7ed63820f422ccf42800a39f4637626')

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" setup.py build
}

check() {
  cd "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" run.py tests
}

package() {
  cd "${_pkg}-${pkgver}"
  "${_py}" setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${_py}-${_pkg}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
