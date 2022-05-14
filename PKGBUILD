# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

_pkgname=g15daemon
pkgname=$_pkgname-git
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
pkgver=3.0.4.r0.g1f4e8b4
pkgrel=1
arch=('x86_64')
url="https://gitlab.com/menelkir/$_pkgname"
license=('GPL')
depends=('libg15render>=3.0')
conflicts=('g15daemon')
provides=('g15daemon')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  echo ""
  echo "This package doesn't come with an init, you should install one:"
  echo "g15daemon-runit"
  echo "g15daemon-openrc"
  echo "g15daemon-systemd"
}
