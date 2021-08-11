# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0.3
pkgrel=2
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
conflicts=('g15daemon-git')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('a2b8e14fce82355f5f14b7fe0adee06f0e73a4444055fd2d5a0afbb72d5bdde9612d2bef1162606d0f20c5bfcc2965a85c64eaea651da8dc752af6a1182dd504')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo ""
  echo "This package doesn't come with an init, you should install one:"
  echo "g15daemon-runit"
  echo "g15daemon-openrc"
  echo "g15daemon-systemd"
}
