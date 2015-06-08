# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=realmd
pkgver=0.15.2
pkgrel=1
pkgdesc="DBus service for joining hosts to Active Directory and FreeIPA realms"
arch=(i686 x86_64)
url="http://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(adcli dbus krb5 openldap polkit)
makedepends=(docbook-xsl intltool packagekit python2 xmlto)
source=("http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
        "http://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('dbe872ea290d093e9c99d4db9b56e63083a2d24775f0be71d86109d51eb8f7bc'
            'SKIP')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --with-distro=defaults  ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
