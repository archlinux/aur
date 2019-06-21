# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+459+g34f9677
_commit=34f9677c4e5384c9b823ce76c3dbeb143a3ff625
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://dino.im
license=(GPL3)
depends=(glib2 glib-networking gtk3 gpgme libgee libgcrypt qrencode libsoup sqlite)
makedepends=(git cmake gettext ninja vala)
source=(git+https://github.com/dino/dino#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd dino
  git describe --tags | sed 's#-#+#g'
}

build() {
  cd dino

  # Uncomment/modify either of the following variables as desired
  _enable="--enable-plugin='notification-sound'"
  #_disable="--disable-plugin='omemo;openpgp;http-files'"

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
