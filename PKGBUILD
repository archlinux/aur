# Maintainer: Martin Rys <rys.pw/contact>
# Previous Maintainer: Jochen Jägers (JochenJ) <aur@diezonks.de>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan
pkgver=1.2.18
pkgrel=1
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url='https://networkmanager.dev/docs/vpn/'
depends=('libsecret' 'libreswan' 'libnl' 'gtk3' 'libnma')
makedepends=('intltool' 'python' 'gettext')
source=("https://download.gnome.org/sources/NetworkManager-libreswan/${pkgver::3}/NetworkManager-libreswan-${pkgver}.tar.xz")
sha256sums=('22e421665e163fd1993f13e5747a3731975245aec31c55c70402f2b18b461137')

build() {
  cd "NetworkManager-libreswan-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/NetworkManager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd "NetworkManager-libreswan-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
