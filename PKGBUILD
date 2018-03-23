# Maintainer: David Runge <dave@sleepmap.de>
pkgname=qmidictl
pkgver=0.5.1
pkgrel=1
pkgdesc="MIDI remote controller application that sends MIDI data over the network, using UDP/IP multicast"
arch=('x86_64')
url="https://qmidictl.sourceforge.io/"
license=('GPL2')
groups=('pro-audio')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('qt5-tools')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bb10adf38eb4cf7efa6f899e9ba1426ef2bdf0e9dfbece7392a1f4aea3a4c958d6245f0ae3a8347dd82529d2c3d149d765b3ce6f34f85898f80eff112fa4c51f')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {AUTHORS,ChangeLog,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
