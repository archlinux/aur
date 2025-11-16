# Maintainer: Jenny Danzmayr <mail@scientress.de>
# Previous Maintainer: Nicolas Goy <me@kuon.ch>

pkgname=openswitcher
pkgver=0.13.0
pkgrel=1
pkgdesc="Library implementing the ATEM video switcher protocol and a GTK3.0 application"
arch=("any")
url="https://git.sr.ht/~martijnbraam/pyatem"
license=('GPL3' 'LGPL3')
groups=()
depends=('python' 'python-pyusb' 'python-cairo' 'libhandy')
makedepends=('git' 'meson' 'python-setuptools')
source=("$pkgname"::"git+${url}#tag=2ae9fce909736346688cf97facb824b9b91788e0")
b2sums=('cae17ae627c523bbd68ee83a2bd0396e6570bbf484fc0d91a4fc34d3244b5ad29614a394becb8561199d7ed38fe3edb9f0b49050ec04c8b22ee4b2dec7edfdc8')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
  meson build --prefix /usr
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root "$pkgdir"
  DESTDIR=$pkgdir meson install -C build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSE-gpl3.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-gpl3"
  install -Dm644 LICENSE-lgpl3.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-lgpl3"
}
