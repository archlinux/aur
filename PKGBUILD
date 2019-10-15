# Maintainer: Jochen Jägers (JochenJ) <aur@diezonks.de>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=networkmanager-libreswan-git
pkgver=1.2.13.dev.r1.ga7366e3
pkgrel=2
pkgdesc="NetworkManager IPSec VPN plugin for Libreswan"
arch=('i686' 'x86_64')
license=('GPL')
url='http://wiki.gnome.org/Projects/NetworkManager/VPN'
provides=('networkmanager-libreswan')
conflicts=('networkmanager-libreswan')
depends=('libsecret' 'libreswan' 'libnl' 'gtk3' 'libnma')
makedepends=('intltool' 'python' 'git' 'gettext')
source=(git+https://gitlab.gnome.org/GNOME/NetworkManager-libreswan.git#branch=master)
sha256sums=('SKIP')

build() {
  cd $srcdir/NetworkManager-libreswan

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/networkmanager \
    --enable-more-warnings=yes \
    --disable-static
  make
}

package() {
  cd $srcdir/NetworkManager-libreswan
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd $srcdir/NetworkManager-libreswan
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
