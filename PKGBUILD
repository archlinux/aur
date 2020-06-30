# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=linux-wifi-hotspot
pkgver=2.0.0+4+g61ac43a
pkgrel=1
pkgdesc="Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)"
arch=('x86_64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD')
depends=('hostapd'
         'iw'
         'gtk3'
         'procps-ng'
         'dnsmasq'
         'iproute2')
makedepends=('cmake' 'git')
optdepends=('haveged: For random MAC generation'
            'wireless_tools: if iw cannot recognize your adapter')
conflicts=('create_ap' 'wihotspot')
provides=('create_ap' 'wihotspot')
install="$pkgname.install"
_commit=61ac43ab50b8a751d94d4ac78c2d9448fdb97a66
source=("git+https://github.com/lakinduakash/linux-wifi-hotspot#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t \
   "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 src/desktop/hotspot.png \
    "$pkgdir/usr/share/pixmaps/wihotspot.png"
  install -Dm644 src/desktop/wifihotspot.desktop \
    "$pkgdir/usr/share/applications/wihotspot.desktop"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"
}
# vim:set ts=2 sw=2 et:
