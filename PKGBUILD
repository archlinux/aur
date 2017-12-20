# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv
_commit=b2c4dcbd2f0aacefac6b0951f74d8acd74a805a7
pkgver=17.12
pkgrel=1
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('any')
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
sha256sums=('19804f92f7c053ad5a00f64d5faa232f32fd36809f3cda1945b204018874c1ef')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}/doc/guide"
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
