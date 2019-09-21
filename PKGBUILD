# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=pyshark
pkgname=('python-pyshark')
pkgver=0.4.2.9
pkgrel=1
pkgdesc='Python wrapper for tshark, allowing python packet parsing using wireshark dissectors'
url='https://github.com/KimiNewt/pyshark'
arch=('any')
license=('MIT')
makedepends=('wireshark-cli' 'python-py' 'python-lxml' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pyshark/pyshark-${pkgver}.tar.gz"
        "LICENSE.txt")
sha512sums=('6c9baff71a628838f778c04c1c5da2ad5b275341f1cb1a0459c5544b772f9d7b66f152daaf68cd9698082814f1fc1530a2b727adfac6919f1ffb857b8188f9e4'
            '6e3b6007f701cf20091c8d45fcd54c45ec273941580011234031f89ac2d8a68f99e9f091ba0b6b293f4195b37dec62a43c85f6a546f30cf00f54f5812360fbb4')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

package_python-pyshark() {
  depends=('wireshark-cli' 'python-py' 'python-lxml')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ${srcdir}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
