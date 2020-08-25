# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-pdb2pqr
_name=${pkgname#python-}
pkgver=3.0.1
pkgrel=3
pkgdesc="Automates many of the common tasks of preparing structures for continuum solvation calculations as well as many other types of biomolecular structure modeling, analysis, and simulation."
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.5' 'python-propka>=3.2' 'python-pandas>=1.0' 'python-pytest>=5.4.1')
makedepends=(patch)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "fix_entrypoint.patch"
        "fix_matchedatoms.patch")
sha256sums=('15ac0ce77dc17fb459092aca12cc7c2c070904f77914f1197282e28f418b6bd0'
            'bb177e8fb9a31f2486e5682ae97139ebf87948fb4dc33dc892e90ff606df7211'
            '8708438980e5dda5036d2c4fa404d1817104ebbf0443f7798a2698b75a38fe9c')
options=(!emptydirs)

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -Np0 -i "${srcdir}/fix_entrypoint.patch"
    patch -Np0 -i "${srcdir}/fix_matchedatoms.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

