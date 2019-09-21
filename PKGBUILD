# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark')
pkgver=0.4.2.3
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli' 'python-py' 'python-lxml' 'python-logbook' 'python-setuptools')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/KimiNewt/pyshark/archive/v${pkgver}.tar.gz)
sha512sums=('bbef857dad5e5141e0ec7c04dba9faca81b17d67a7151959e9935577428cd1415e173e9c7ededff46f8621bcbbdfbe7a96ca5cfd65d7143fb6f235c0167964b6')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py build
}

package_python-pyshark() {
  depends=('wireshark-cli' 'python-py' 'python-lxml' 'python-logbook')
  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
