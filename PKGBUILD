# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=magic-wormhole
pkgver=0.12.0
pkgrel=3
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://github.com/magic-wormhole/magic-wormhole"
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-txtorcon' 'python-pyopenssl')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-magic-wormhole-transit-relay' 'python-magic-wormhole-mailbox-server')
provides=('wormhole' 'wormhole-server' 'python-wormhole')
conflicts=('wormhole' 'wormhole-server' 'python-wormhole')
replaces=('wormhole' 'wormhole-server' 'python-wormhole')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/magic-wormhole/magic-wormhole/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('141244e746b0718f2c9417e8f7de6a714b0feb051aea8c7950ea0d1bc5d2e24e922bed29544fe76aa61b06aa2ce2b5f330824017af8c6030813415e6c004c716')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -vDm 644 docs/*.md -t "${pkgdir}/usr/share/docs/${pkgname}"
  install -vDm 644 docs/wormhole.1 -t "${pkgdir}/usr/share/man/man1"
}
