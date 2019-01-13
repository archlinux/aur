# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbase="rtmidi"
pkgbase="python-${_pkgbase}"
pkgname=(${pkgbase} python2-${_pkgbase})
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64' 'arm')
url="https://github.com/SpotlightKid/python-rtmidi"
license=('MIT')
depends=('jack')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('8e7a50fff1b0bab16b71e19af17dfc91aad580d46ceb0bf36307555413a44d06')


prepare() {
  cp -r ${pkgbase}-${pkgver} python2-${_pkgbase}-${pkgver}
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-${_pkgbase}-${pkgver}"
  python2 setup.py build
}

package_python-rtmidi() {
  pkgdesc="Python bindings for the cross-platform MIDI I/O library RtMidi"
  depends+=('python')
  makedepends+=('cython')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-rtmidi() {
  pkgdesc="Python 2 bindings for the cross-platform MIDI I/O library RtMidi"
  depends+=('python2')
  makedepends+=('cython2')

  cd "${srcdir}/python2-${_pkgbase}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
