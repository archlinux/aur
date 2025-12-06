# Maintainer: Robert L Box <robertbox514@gmail.com>

pkgname=pwncat
pkgver=0.1.2
pkgrel=2
pkgdesc='Netcat on steroids with Firewall, IDS/IPS evasion, bind and reverse shell, self-injecting shell and port forwarding magic - and its fully scriptable with Python (PSE)'
arch=('any')
url='https://cytopia.github.io/pwncat'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cytopia/pwncat/archive/v${pkgver}.tar.gz")
sha256sums=('bca4deb557d4341a6ae3695cd42b9571c247ac4d81dca141e3b26119621a79fd')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '14i py_modules=[],' setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 man/pwncat.1 -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
