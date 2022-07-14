# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark')
pkgver=0.5.3
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli' 'python-py' 'python-lxml' 'python-setuptools' 'python-packaging')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/KimiNewt/pyshark/archive/v${pkgver}.tar.gz")
sha512sums=('cedccc214b767c8dacd27659583a75bb1c7b9e01293b39fc13fe02886550205fa6a076a14fd25de495cea50d0ec450ce97e7f11a5b72eaecbe3ed11256068868')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py build
}

package_python-pyshark() {
  depends=('wireshark-cli' 'python-py' 'python-lxml' 'python-packaging')
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
