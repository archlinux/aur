# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.84
pkgrel=3
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('custom')
makedepends=('python-setuptools')
checkdepends=('python-scipy' 'python-rdflib' 'python-igraph' 'python-reportlab' 'python-networkx' 'python-mmtf' 'python-matplotlib' 'python-coverage')
depends=('python-numpy')
optdepends=('python-mysql-connector: for BioSQL module')
source=(http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('cadf82959626b2b9f4482757d95d7c4db262d3e1e4a007567a2ed7f1f4114a0d6543886a4971dffbe0ff43579aa7e0c3b7132d8b5e58022e8ddf0b13dbf07f52')
options=(!debug)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  local pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
  local impl=$(python -c 'import platform; print(platform.python_implementation().lower())')
  local machine=$(python -c 'import platform; print(platform.machine())')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
