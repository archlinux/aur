# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0.4
pkgrel=1
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
conflicts=('g15daemon-git')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('4adbb11ca8128bbaff5ad1dee17ddcfcdfca589f7e8a1a264127dd9d5aec39e07e4986a4b78f4199fb7f3e12979fd8d50a851b047b6cb8cfa13410aa59df062a')

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
