# Maintainer: Jenny Danzmayr <mail@scientress.de>
# Previous Maintainer: Nicolas Goy <me@kuon.ch>

pkgname=openswitcher
pkgver=0.12.0
pkgrel=1
pkgdesc="Library implementing the ATEM video switcher protocol and a GTK3.0 application"
arch=("any")
url="https://git.sr.ht/~martijnbraam/pyatem"
license=('GPL3' 'LGPL3')
groups=()
depends=('python' 'python-pyusb' 'python-cairo' 'libhandy')
makedepends=('git' 'meson' 'python-setuptools')
source=("$pkgname"::"git+${url}#tag=a6e53b80055a23a5c21a3bd505d7acbe7e5b58d0")
b2sums=('e443eb48d2da5880e88989967987018dee27b4e6187e07d5fd08a96fbd8f6a922593280d3775f3bbfa23a8f21efd81ec3510f1049fe6c89ab47ee6ae9cb9716f')

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
