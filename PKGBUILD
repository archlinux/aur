# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan
pkgver=1.2.6
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL')
url='http://wiki.gnome.org/Projects/NetworkManager/VPN'
depends=('libnm-gtk' 'libsecret' 'libreswan' 'libnl')
makedepends=('intltool' 'python')
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz)
sha256sums=('604fc207598dc9bac2c37e3d242e41bd80d6a74e2a9358e66debc9b667672c96')

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
