# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=patroneo
pkgver=2.3.0
pkgrel=1
pkgdesc="An easy to use pattern based midi sequencer"
arch=(x86_64)
url="https://www.laborejo.org/patroneo/"
license=(GPL3)
groups=(pro-audio)
depends=(glibc hicolor-icon-theme python python-pyqt5 ttf-dejavu)
makedepends=(glib2 jack libsndfile util-linux-libs)
optdepends=('new-session-manager: for session management')
source=("https://www.laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('d2b6e7a6bd712130d36be2448f5a4c6225d7bd2f868440df41c523f482350687dc32e80a53388d461c9b8ae4c1f5f5b1bd1d712639cb6f8e7a357ea1557ee584'
            'SKIP')
b2sums=('4e48ac208b9f7bd0b6c6952c67c1f94f4da29e7e9b6959b4fd624c6fcab28e280916df8fe89a176902f0254ec3cadafb4d22c73182672ace2e856272a7ec782f'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  depends+=(libglib-2.0.so libjack.so libsndfile.so libuuid.so)

  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
