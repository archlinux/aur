# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
pkgname=hdtv
pkgver=24.10
pkgrel=2
pkgdesc="Nuclear spectrum analysis tool on top of the ROOT data analysis toolkit"
arch=('i686' 'x86_64')
url="https://github.com/janmayer/${pkgname}"
license=('GPL')
conflicts=('hdtv')
provides=('hdtv')
depends=('glibc'
  'cern-vdt'
  'libx11'
  'python'
  'root'
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
sha256sums=('e54093917e5037efc747e8fc164d105f61f5e334fd65d0194bbed8b0a753b6e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/doc/guide"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/license.md"
}
