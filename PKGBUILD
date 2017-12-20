# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv-git
_pkgname=hdtv
pkgver=r965.b2c4dcbd
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
makedepends=('git' 'libx11' 'python-docutils')
#checkdepends=('python-pytest')
options=(!emptydirs)
source=('git+https://gitlab.ikp.uni-koeln.de/staging/hdtv.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/doc/guide"
    make || return 1
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
