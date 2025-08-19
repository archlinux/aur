# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=daetools
pkgver=2.5.0
pkgrel=1
pkgdesc='Equation-based object-oriented modelling, simulation and optimisation software'
arch=('x86_64')
url="http://www.daetools.com"
license=('GPL3')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-matplotlib'
         'python-lxml'
         'python-pandas'
         'python-openpyxl')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/daetools/files/daetools/${pkgver}/daetools-${pkgver}-gnu_linux-x86_64.zip/download")
sha256sums=('0c94d7cd6fc5478e6267f5ed610f36334f9249b750193e5626efb5cefb37c300')

build() {
  cd "${pkgname}-${pkgver}-gnu_linux-x86_64"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}-gnu_linux-x86_64"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "${pkgdir}/home"
  rm -rf "${pkgdir}/usr/bin"/*.bat
  rm -rf "${pkgdir}/usr/bin"/create_shortcuts.js
  install -Dm644 usr/share/pixmaps/daetools-48x48.png -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 usr/share/applications/daetools-daeExamples.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 usr/share/applications/daetools-daePlotter.desktop -t "${pkgdir}/usr/share/applications/"
}
# vim:set ts=2 sw=2 et:
