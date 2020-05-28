# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pwncat
pkgver=0.0.22.alpha
_pkgver=0.0.22-alpha
pkgrel=1
pkgdesc='Netcat on steroids with Firewall, IDS/IPS evasion, bind and reverse shell, self-injecting shell and port forwarding magic - and its fully scriptable with Python (PSE)'
arch=('any')
url='https://cytopia.github.io/pwncat'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cytopia/pwncat/archive/v${_pkgver}.tar.gz")
sha256sums=('23b67ad1e83511953b4d8bae45f1b1a971cee29426e599adb16b15e17fde5dfe')

build() {
  cd "${pkgname}-${_pkgver}"
  python setup.py build
  gzip --force man/pwncat.1
}

package() {
  cd "${pkgname}-${_pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 man/pwncat.1.gz -t "${pkgdir}/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et: