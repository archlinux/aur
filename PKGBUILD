# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=daetools-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Equation-based object-oriented modelling, simulation and optimisation software'
arch=('x86_64')
url="http://www.daetools.com"
license=('GPL3')
provides=('daetools')
depends=('python2'
         'python-numpy'
         'python-scipy'
         'python-matplotlib'
         'python-lxml'
         'python-pandas'
         'python-openpyxl')
makedepends=('python-setuptools')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://sourceforge.net/projects/daetools/files/daetools/${pkgver}/daetools-${pkgver}-gnu_linux-x86_64.tar.gz/download")
sha256sums=('10cc8129d28aa9595bf5b798df13761751800fab558cb9a35ed558265d12a5f6')

build() {
  cd "${pkgname%-bin}-${pkgver}-gnu_linux"
  python setup.py build
}

package() {
  cd "${pkgname%-bin}-${pkgver}-gnu_linux"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "${pkgdir}/home"
  rm -rf "${pkgdir}/usr/bin"/*.bat
  rm -rf "${pkgdir}/usr/bin"/create_shortcuts.js
  install -Dm644 usr/share/pixmaps/daetools-48x48.png -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 usr/share/applications/daetools-daeExamples.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 usr/share/applications/daetools-daePlotter.desktop -t "${pkgdir}/usr/share/applications/"
}
# vim:set ts=2 sw=2 et: