# Maintainer: Jochen Jägers (JochenJ) <aur@diezonks.de>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan
pkgver=1.2.16
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL')
url='http://wiki.gnome.org/Projects/NetworkManager/VPN'
depends=('libsecret' 'libreswan' 'libnl' 'gtk3' 'libnma')
makedepends=('intltool' 'python' 'gettext')
source=(https://ftp.gnome.org/pub/GNOME/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz)
sha256sums=('c6b7ef71f6587d9c09e37ece6c20b4c4a5456f80c90e5c9eb6ec89e8ec38e654')

build() {
  cd NetworkManager-libreswan-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/NetworkManager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd NetworkManager-libreswan-$pkgver
  make DESTDIR="$pkgdir" install
}
