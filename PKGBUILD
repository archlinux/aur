# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark')
pkgver=0.5
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli' 'python-py' 'python-lxml' 'python-setuptools' 'python-packaging')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/KimiNewt/pyshark/archive/v${pkgver}.tar.gz")
sha512sums=('c2bb30cbdc71c77e9cf87909c7267f4e10475a8a01f82e4d85f9f661cbf2be308e6c838a4a26094e06637524bddece50e2b413a5966d81448e0ea4e66b543744')

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
