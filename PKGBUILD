# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-hid-parser
pkgver=0.0.3
pkgrel=2
pkgdesc='Typed pure Python library to parse HID report descriptors'
arch=('any')
url='https://github.com/usb-tools/python-hid-parser'
license=('MIT')
depends=(python-typing_extensions)
makedepends=(python-{build,installer,setuptools,wheel})
checkdepends=(python-{hypothesis,pytest})
source=("https://github.com/usb-tools/python-hid-parser/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('00a485093ae4f1268c3e6ed8b194f1c0f1579e665863cd609a4690f292b8646ec6d51ab35f803dac7cb0185b0b837fe6ae810a7567fe96102d43e39eefb950e6')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
