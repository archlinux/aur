# Maintainer: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python-pocket
_name=${pkgname#python-}
pkgver=0.3.6
pkgrel=2
pkgdesc="api wrapper for getpocket.com"
url="https://github.com/tapanpandita/${_name}"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  LICENSE::https://raw.githubusercontent.com/tapanpandita/pocket/master/LICENSE.md)
sha512sums=('7cee6a5e0c5840cae136b264ba9404cdb9b17dbcc0b4051c55cb1e1e1ca3e014862081de5fe7bd687f5d4901f7e456d812091120325c3b5a5c5aeda8978da573'
            '311093e2f50620a0ff523b8ac01187001832fc25b809bd220c03f58715e8a3c3e013c2305d7d6920b5a6b30ddd693515596e476d41d1c97ceed042d241b633b1')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: sts=2 sw=2 et ft=PKGBUILD
