# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pwncat
pkgver=0.1.1
pkgrel=1
pkgdesc='Netcat on steroids with Firewall, IDS/IPS evasion, bind and reverse shell, self-injecting shell and port forwarding magic - and its fully scriptable with Python (PSE)'
arch=('any')
url='https://cytopia.github.io/pwncat'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cytopia/pwncat/archive/v${pkgver}.tar.gz")
sha256sums=('24c52fd9463c91217b7c7405a6cdb567d14e0de586a2a34cf226a8d4a3467776')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
  gzip --force man/pwncat.1
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 man/pwncat.1.gz -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
