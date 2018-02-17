# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv
_commit=701eecd65e6708e4ff6c0123c2f4972d56b3d499
pkgver=18.01
pkgrel=1
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('i686' 'x86_64')
url="https://gitlab.ikp.uni-koeln.de/staging/hdtv"
license=('GPL')
conflicts=('hdtv')
provides=('hdtv')
depends=('python'
         'root'
         'libmfile'
         'python-setuptools'
         'python-scipy'
         'python-matplotlib')
makedepends=('libx11' 'python-docutils')
#checkdepends=('python-pytest')
options=(!emptydirs)
source=("${pkgname}-v${pkgver}.tar.gz::https://gitlab.ikp.uni-koeln.de/staging/${pkgname}/repository/v${pkgver}/archive.tar.gz")
sha256sums=('e4c54c7f21310471b930adf2b764e3c7a360f07b260a5be7fb543c53ea3cef11')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}/doc/guide"
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
