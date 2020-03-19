# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>

pkgname=linx-server
pkgver=2.3.3
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website '
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL3')
install=linx-server.install
options=('!strip')
makedepends=('go' 'go.rice')
backup=('etc/webapps/linx-server/config.ini')

source=("https://github.com/andreimarcu/linx-server/archive/v${pkgver}.tar.gz" 'linx-server.service' 'config.ini')
sha256sums=('96ef46cd737cc7ee3c4af0d1560f75e9d258579f53d1e939eb1d060433417f13'
            '96dda375b90c57e137b95442b8d4a24a5b763915eb1b8359e893f53af5db9630'
            'e7bbd0e1c16447665b5ef8bfa0855760e758921d936e1981e15537dc9e8f3035')

build() {
  cd "$pkgname-$pkgver"
  go build .
  rice append --exec $pkgname
}

package() {
  cd "$srcdir"
  install -Dm644 config.ini "$pkgdir/etc/webapps/linx-server/config.ini"
  install -Dm644 linx-server.service "$pkgdir/usr/lib/systemd/system/linx-server.service"
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/webapps/linx-server/"
  install -Dm755 linx-server "$pkgdir/usr/bin/linx-server"
}
