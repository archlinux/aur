# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark')
pkgver=0.4.2.11
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli' 'python-py' 'python-lxml' 'python-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/KimiNewt/pyshark/archive/v${pkgver}.tar.gz")
sha512sums=('4f822328ac06671652a21219f4abce8026c0da7bd47f2cb55e686ff70b49391599852cdbe2422183ffae5729a4e8a68e359c8371a8e53e379a198bb78a81b078')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py build
}

package_python-pyshark() {
  depends=('wireshark-cli' 'python-py' 'python-lxml')
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
