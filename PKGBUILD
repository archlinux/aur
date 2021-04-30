# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv
pkgver=21.4
pkgrel=1
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('i686' 'x86_64')
url="https://github.com/janmayer/${pkgname}"
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
makedepends=('python-docutils')
#checkdepends=('python-pytest')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23909b3621bff191177d4119c85e6db9a2badd69742f13c4e39df7b1e07395a4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/doc/guide"
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm 0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
