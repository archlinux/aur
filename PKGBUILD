# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=realmd
pkgver=0.17.1
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap packagekit polkit)
optdepends=('sssd: Active Directory, FreeIPA, LDAP client'
            'samba: traditional Active Directory client')
makedepends=(docbook-xsl git intltool python xmlto)
source=("https://gitlab.freedesktop.org/realmd/realmd/-/archive/${pkgver}/realmd-${pkgver}.tar.gz")
sha256sums=('e8b51d5918418e9dc55006f0371831ab841f00a065baf2d001b6b5245f24a532')

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
