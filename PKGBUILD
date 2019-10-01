# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-termcolors' 'python2-termcolors')
pkgdesc="A Python script to show off your beautiful terminal palette"
pkgver=0.1.0
pkgrel=2
license=('MIT')
url='https://github.com/scizzorz/termcolors'
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "python2.patch"
  "python.patch"
)
sha256sums=('2ca59c092bc063ac298110e1b96a4af25bd14692be4f5959c162b86a386cfd3b'
            'd1dd71acbd26a8646d9ba4f4c5baba168fcf6ae0fb645cbcfcbf39ec3de44fc2'
            '89bdb486d1af665de573ef3e2dc64c2622f9645f0928112fe036459cb9a30e07')

prepare() {
  cd "${srcdir}/termcolors-${pkgver}"
  mv README.md README.rst
  cp -r "${srcdir}/termcolors-${pkgver}" "${srcdir}/termcolors-${pkgver}-2"
  patch -p1 <"${srcdir}/python.patch"

  cd "${srcdir}/termcolors-${pkgver}-2"
  patch -p1 <"${srcdir}/python2.patch"
}

package_python2-termcolors() {
  depends=('python2')
  cd "${srcdir}/termcolors-${pkgver}-2"
  python2 setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-termcolors() {
  depends=('python')
  cd "${srcdir}/termcolors-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
