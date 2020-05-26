# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname=exabgp
pkgver=4.2.8
pkgrel=1
pkgdesc="The BGP swiss army knife of networking"
url="https://github.com/Exa-Networks/exabgp"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("exabgp-${pkgver}.tar.gz::https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")
sha256sums=('b9d6ea1e3c961d6a3dcbcd7ad185e4daa29ae8ca167b7c7b49a61e573a030416')

package() {
  cd "$srcdir/exabgp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 etc/systemd/exabgp.service "${pkgdir}/usr/lib/systemd/system/exabgp.service"
  install -D -m644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

