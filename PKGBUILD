# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=etherwall
pkgver=2.0.2
pkgrel=1
pkgdesc="Ethereum GUI Wallet (QT5)"
arch=(i686 x86_64)
url="http://etherwall.com"
license=('GPL3')
depends=('qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-websockets' 'geth' 'protobuf' 'hidapi' 'libsystemd')
source=("https://github.com/almindor/${pkgname}/archive/v${pkgver}.tar.gz" 'https://github.com/trezor/trezor-common/archive/4ac8e8c.tar.gz')
sha256sums=('e8d4868d75aa8db4d02862da5d920ae0f2b532938362a6d69967056986ae7cce' '95bc637d7b49697d06567b35ef2cbb2fdba1ce8c8e27d95e9cd242ec2b3fa459')

build() {
  cd "etherwall-$pkgver"

  SRCDIR="../trezor-common-4ac8e8cdffb04f83ba9f71c27513f8dced1aa3b0/protob" ./generate_protobuf.sh
  qmake -config release && make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"

  cd "etherwall-$pkgver"
  cp "../../etherwall.desktop" "$pkgdir/usr/share/applications"
  cp "./Etherwall" "$pkgdir/usr/bin/etherwall"
  cp "./qml/images/icon.png" "$pkgdir/usr/share/pixmaps/etherwall.png"
}
