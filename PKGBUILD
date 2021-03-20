# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=realmd
pkgver=0.17.0
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git intltool python xmlto)
source=("https://github.com/freedesktop/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8188333705ec6c9eb7bc98ade2a5dc257b158272ae2d0365d446cbae59c56aec')

build() {
  cd "$pkgname-$pkgver"
  AUTOMAKE=automake ACLOCAL=aclocal ./autogen.sh \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" DBUS_POLICY_DIR="/usr/share/dbus-1/system.d" install
}

# vim: ts=2:sw=2:et
