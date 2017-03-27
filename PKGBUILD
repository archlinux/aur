# Maintainer: epitron <chris@ill-logic.com>

pkgname=camlistore
pkgver=20170301
pkgrel=1
pkgdesc='Camlistore (Content-Addressable Multi-Layer Indexed Storage) is your personal storage system for life.'
arch=('i686' 'x86_64')
url='https://camlistore.org/'
license=('Apache')
depends=('sqlite')
optdepends=('mongodb: as indexer database'
  'postgresql: as indexer database'
  'mariadb: as indexer database')
makedepends=('go')
install=camlistore.install
source=(
  https://camlistore.org/dl/monthly/camlistore-$pkgver-src.zip
  camlistore.service
)
sha256sums=(
  92cc506728bbcba014ef455dcd3c720cb1fb244581dbb21046c8dcb8fc619fbc
  506eef3f0e95d42c521c9df58f2f9d497d1c2f85f5d6fc66458f25beca8be047
)

build() {
  cd "$srcdir/camlistore.org"
  echo "$pkgver" > VERSION
  go run make.go
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" "${srcdir}"/camlistore.org/bin/{camdeploy,camget,camlistored,cammount,camput,camtool,devcam,hello,publisher,scanningcabinet}

  install -D -m644 "${srcdir}/camlistore.service" "${pkgdir}/usr/lib/systemd/system/camlistore.service"
}
