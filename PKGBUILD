#$Id$
# Maintainer: Felix Schindler <felix at schindlerfamily dot de>
# Contributor: Jan De Groot <jgc@archlinux.org>

pkgname=gnome-keyring-wo-gpg
_pkgname=gnome-keyring
pkgver=3.16.0
pkgrel=1
pkgdesc="GNOME Password Management daemon (without gnupg-agent functionality)"
provides=('gnome-keyring=3.16.0-1')
conflicts=('gnome-keyring')
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gcr' 'libcap-ng')
makedepends=('intltool' 'gtk-doc')
groups=('gnome')
options=('!emptydirs')
url="http://www.gnome.org"
install=gnome-keyring.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz)
sha256sums=('15a3bb8c53855a4ff0dbbdfbe4ec3df206c32048f50bdc76a51f8e3e14ece1f5')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring \
      --with-pam-dir=/usr/lib/security --with-root-certs=/etc/ssl/certs \
      --disable-schemas-compile \
      --disable-gpg-agent
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
