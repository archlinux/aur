# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Stunts <f.pinamartins at gmail dot com>
# Contributor: damir <damir at archlinux dot org>

pkgname=python-biopython
_pkgname=biopython
pkgver=1.86
pkgrel=1
pkgdesc="Freely available Python tools for computational molecular biology"
arch=('x86_64')
url="http://www.biopython.org"
license=('LicenseRef-Biopython License')
makedepends=('python-setuptools')
checkdepends=('python-scipy' 'python-rdflib' 'python-igraph' 'python-reportlab' 'python-networkx' 'python-mmtf' 'python-matplotlib' 'python-coverage')
depends=('python-numpy' 'glibc' 'python' 'python-scipy' 'python-pillow')
# optdepends from https://github.com/biopython/biopython?tab=readme-ov-file#optional-dependencies
optdepends=('python-mysql-connector: for BioSQL module'
            'python-reportlab: for graph generation'
            'python-networkx: for certain niche functions in Bio.Phylo module'
            'python-matplotlib: to plot phylogenetic trees.'
            'python-rdflib: CDAO parser under Bio.Phylo module'
           )
source=("http://www.biopython.org/DIST/${_pkgname}-${pkgver}.tar.gz"
       )
sha512sums=('eeb0f086a92ee043561758c396b8832d7cb8f447ae1873c967493fbee18496d81fcd166b32267d00ae7989b7d8453024e785617abb462a7561feb8017f72a07e')
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
