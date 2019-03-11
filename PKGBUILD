# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli-git
_pkgname=adcli
pkgver=0.8.2.r30.g3c93c96
pkgrel=1
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(krb5 openldap)
makedepends=(docbook-xml docbook-xsl intltool xmlto)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/realmd/adcli.git")
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
