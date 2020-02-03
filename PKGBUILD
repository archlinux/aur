# Maintainer: Hubbe King <hubbe128@gmail.com>

pkgname=targetd
pkgver=0.8.9
pkgrel=1
pkgdesc="Remote configuration of a LIO-based storage appliance"
arch=('any')
url="https://github.com/open-iscsi/targetd"
license=('GPL3')
provides=('targetd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-iscsi/targetd/archive/v${pkgver}.tar.gz")
sha256sums=('16aec1cd70ab515eed08b801f434a3f1aa810675f305df61b368772c30af7976')
makedepends=('python-setuptools')
depends=('targetcli-fb' 'python-rtslib-fb' 'python-configshell-fb' 'libblockdev' 'python-setproctitle' 'python-yaml')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -D -m755 scripts/targetd "$pkgdir"/usr/bin/targetd
  install -D -m644 ../../targetd.service "$pkgdir"/usr/lib/systemd/system/targetd.service
  install -D -m644 ../../targetd.yaml "$pkgdir"/usr/share/targetd/targetd.yaml
  install -D -m644 targetd.8 "$pkgdir"/usr/share/man/man8/targetd.8
}
