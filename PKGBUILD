# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Fabiano Furtado < fusca14 (at) gmail (dot) com >

pkgname=wifite
pkgver=131
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=('any')
url="https://github.com/derv82/wifite"
license=('GPL2')
depends=('python2' 'aircrack-ng')
optdepends=(
  'reaver: WPS attack support'
  'pyrit: detect WPA handshakes'
  'wireshark-cli: detect handshakes'
  'cowpatty: detect WPA handshakes'
  'macchanger: change MAC for attacks'
)
_pkghash='fd486ba7d4714cc79405eb895d3808b0f9928472'
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/derv82/${pkgname}/archive/${_pkghash}.tar.gz)
sha512sums=('e260d8a0671b13edb14f86151eec98e55cbab7edb0123d76c322f4564c68b54811895b991572aa0c9e9a38df7b5a6c850574361f1f4a4bf51fe4a72688d6ad1b')

prepare() {
  cd ${pkgname}-${_pkghash}
  sed -e 's|usr/bin/python$|/usr/bin/env python2|g' -i wifite.py
}

package() {
  cd ${pkgname}-${_pkghash}
  install -Dm 755 wifite.py "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
