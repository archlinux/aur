# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv-git
_pkgname=hdtv
pkgver=r1182.b8b057a
pkgrel=1
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('i686' 'x86_64')
url="https://github.com/janmayer/hdtv"
license=('GPL')
conflicts=('hdtv')
provides=('hdtv')
depends=('glibc'
         'libx11'
         'python'
         'root>=6.22.06'
         'python-matplotlib'
         'python-prompt_toolkit'
         'python-setuptools'
         'python-scipy'
         'python-traitlets'
         'python-uncertainties')
makedepends=('git' 'python-docutils')
#checkdepends=('python-pytest')
options=(!emptydirs)
source=("git+${url}.git")
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
