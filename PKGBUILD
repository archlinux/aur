# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=othellotk
_pkgname=othelloTk
pkgver=0.1.1
pkgrel=2
pkgdesc="Othello (aka Reversi) is an Edax GUI to play Othello against the Edax engine"
arch=('any')
url="https://johncheetham.com/projects/${pkgname}/index.html"
license=('GPL-3.0-only')
depends=('python3' 'tk' 'edax-reversi')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/johncheetham/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c3e0634ccd705e074cb45802944a626deb8169df439ff0737e9c4bdd80391adb')            

prepare() {
    # removing the deprecated ez_setup - ensure that build depends on local python-setuptools:

    # 1) remove ez_setup.py entirely:
    rm "${srcdir}/${_pkgname}-${pkgver}/ez_setup.py"

    # 2) remove the two lines from the main setup script that reference the ez_setup.py:
    sed -i '2,3d' "${srcdir}/${_pkgname}-${pkgver}/setup.py"
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}"
}
