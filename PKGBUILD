# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgbase="rtmidi"
pkgbase="python-${_pkgbase}"
pkgname=(${pkgbase} python2-${_pkgbase})
pkgver=1.0.0
pkgrel=3
arch=('i686' 'x86_64' 'arm')
url="https://github.com/SpotlightKid/python-rtmidi"
license=('MIT')
depends=('jack')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/32/4d/8321a72874916acd77ef93f22cceae78b5c7534711b9c12cd870d7c7666c/${pkgbase}-$pkgver.tar.bz2")
sha256sums=('a00b7204587823f7e0d9faa2e139f63c3902a1645d1f2213b60e1d3befbb2e42')


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
