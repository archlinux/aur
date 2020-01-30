# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.1.0
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(x86_64)
url=https://dino.im
license=(GPL3)
depends=(gpgme gtk3 libgee qrencode)
makedepends=(git cmake ninja vala libsignal-protocol-c)
optdepends=(noto-fonts-emoji)
source=(dino-$pkgver.tar.gz::https://github.com/dino/dino/archive/v$pkgver.tar.gz)
sha512sums=('4efd93f292d413ea5f602f2a861df1ff4a5e72b0a8bf93311d2d67afce0d52428c5fb9ed8dbaf9dcc604d3f1b577498018d47eb8f4a1d57e73096d83bc5067fd')

build() {
  cd dino-$pkgver

  # Modify either of the following variables as desired
  # OMEMO, OpenPGP and http-files are enabled by default
  _enable=--enable-plugin='notification-sound'
  #_disable=--disable-plugin='omemo;openpgp;http-files'
  ./configure --prefix=/usr --with-tests $_enable $_disable

  make
}

check() {
  cd dino-$pkgver/build
  ./xmpp-vala-test
  ./signal-protocol-vala-test
}

package() {
  cd dino-$pkgver
  make DESTDIR="$pkgdir" install
}
