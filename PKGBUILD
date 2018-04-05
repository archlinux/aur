# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv-git
_pkgname=hdtv
pkgver=r1016.f35e634
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
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm 0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
