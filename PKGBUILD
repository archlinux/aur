# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli-git
_pkgname=adcli
pkgver=0.7.3
pkgrel=1
pkgdesc="DBus service for configuring kerberos and other online identities."
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(krb5 openldap)
makedepends=(docbook-xsl intltool xmlto)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://anongit.freedesktop.org/realmd/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

build() {
  cd "$_pkgname"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       ;
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
