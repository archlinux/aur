# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv
_commit=f35e63437302548ba6e4a0845a6663f5741358dc
pkgver=18.04
pkgrel=1
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('i686' 'x86_64')
url="https://gitlab.ikp.uni-koeln.de/staging/hdtv"
license=('GPL')
conflicts=('hdtv')
provides=('hdtv')
depends=('glibc'
         'python'
         'root'
         'mfile'
         'python-setuptools'
         'python-scipy'
         'python-matplotlib'
         'python-uncertainties')
makedepends=('libx11' 'python-docutils')
#checkdepends=('python-pytest')
options=(!emptydirs)
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.ikp.uni-koeln.de/staging/${pkgname}/repository/v${pkgver}/archive.tar.gz")
sha256sums=('1352ef93037e40cc33ec02fd64031f314a3e3eae97fe48457d51300a1e0f4f42')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}/doc/guide"
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm 0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
