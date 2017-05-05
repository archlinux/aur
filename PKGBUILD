# Maintainer: epitron <chris@ill-logic.com>

pkgname=camlistore
pkgver=20170505
pkgrel=1
pkgdesc='Camlistore (Content-Addressable Multi-Layer Indexed Storage) is your personal storage system for life.'
arch=('i686' 'x86_64')
url='https://camlistore.org/'
license=('Apache')
depends=('sqlite')
optdepends=('mongodb: as indexer database'
  'postgresql: as indexer database'
  'mariadb: as indexer database')
makedepends=('go>=1.8.0')
install=camlistore.install
source=(
  https://camlistore.org/dl/monthly/camlistore-$pkgver-src.zip
  camlistore.service
)
sha256sums=(
  af0a75eebd52e93154500b50454f964db233d153b5e19f4143e39ea0121a0b77
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
