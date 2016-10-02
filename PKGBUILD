# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan
pkgver=1.2.2
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL')
url='http://wiki.gnome.org/Projects/NetworkManager/VPN'
depends=('libnm-gtk' 'libsecret' 'libreswan' 'libnl')
makedepends=('intltool' 'python')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz)
sha256sums=('0b98fce9f28ffc6873c69b7350d4d54873a1e6e63578b2bf80257bef7de00d16')

build() {
  cd NetworkManager-libreswan-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd NetworkManager-libreswan-$pkgver
  make DESTDIR="$pkgdir" install
}
