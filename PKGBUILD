# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli-git
_pkgname=adcli
pkgver=0.9.2
pkgrel=1
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/realmd/adcli"
license=(GPL3)
depends=(cyrus-sasl-gssapi krb5 libldap)
makedepends=(docbook-xml docbook-xsl git xmlto)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://gitlab.freedesktop.org/realmd/adcli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed "s/-/.r/; s/-/./"
}

prepare() {
  cd "$_pkgname"
  autoreconf -fi
}

build() {
  cd "$_pkgname"
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
