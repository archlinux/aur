# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=('python-termcolors' 'python2-termcolors')
pkgdesc="A Python script to show off your beautiful terminal palette"
pkgver=0.1.0
pkgrel=1
license=('MIT')
url='https://github.com/scizzorz/termcolors'
arch=('x86_64')
# depends=('python' 'python2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  python2.patch
  python.patch)
md5sums=('fc2249cf55752db81bf86ea5e7a2cdad'
  '7d159998a6b049eb51e4051f0dca9bf2'
  '313949661feb29e7ef016fb36da89fab')

prepare() {
  cd "${srcdir}/termcolors-${pkgver}"
  mv README.md README.rst
}

package_python2-termcolors() {

  cd "${srcdir}/termcolors-${pkgver}"
  patch -p1 <"${srcdir}/python2.patch"

  python2 setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-termcolors() {

  cd "${srcdir}/termcolors-${pkgver}"
  patch -p1 <"${srcdir}/python.patch"

  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
