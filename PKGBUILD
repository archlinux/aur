# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+r562+g388cc56
_commit=388cc56674487e7b9e339637369fc55f0e271daf
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://dino.im
license=(GPL3)
depends=(gpgme gtk3 libgee qrencode)
makedepends=(git cmake ninja vala)
source=(git+https://github.com/dino/dino#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd dino
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd dino

  # Modify either of the following variables as desired
  _enable=--enable-plugin='notification-sound'
  #_disable=--disable-plugin='omemo;openpgp;http-files'

  ./configure --prefix=/usr --with-tests $_enable $_disable
  make
}

check() {
  cd dino/build
  ./xmpp-vala-test
  ./signal-protocol-vala-test
}

package() {
  cd dino
  make DESTDIR="$pkgdir" install
}
