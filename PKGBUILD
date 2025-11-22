# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli
pkgver=0.9.3a
pkgrel=1
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/realmd/adcli"
license=(GPL3)
depends=(
  cyrus-sasl-gssapi
  krb5
  libldap
)
makedepends=(
  docbook-xml
  docbook-xsl
  git
  smbclient   # optional, for offline join support
  xmlto
)
source=("git+https://gitlab.freedesktop.org/realmd/adcli.git#tag=$pkgver")
sha256sums=('34e4aaa3c083479f9ad0d6592c719b0bb774c50a2118c096042bfcc189be3136')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed "s/-/.r/; s/-/./"
}

prepare() {
  cd "$pkgname"
  autoreconf -fi
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       ;
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
