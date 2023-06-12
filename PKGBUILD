# Maintainer: tarball <bootctl@gmail.com>

pkgname=tika-server-bin
pkgver=2.8.0
pkgrel=1
pkgdesc='Apache Tika server — detect and extract metadata and text from over a thousand file types'
arch=(any)
url='https://tika.apache.org'
license=(Apache)
provides=(tika-server)
conflicts=(tika-server)
depends=('java-runtime-headless')
source=(
  "https://dlcdn.apache.org/tika/$pkgver/tika-server-standard-$pkgver.jar"
  'tika-server.service'
)
sha256sums=('6cd277d742bcdf85395c418e2cfc09a88d741a43de9a316ee1ca42d4e5a86972'
            '4bfed9962d831fa5de01c94f83ee4784c9dd371d72035125508a63debd161862')
noextract=("tika-server-standard-$pkgver.jar")

package_tika-server-bin() {
  install -dm755 "$pkgdir/etc/default"

  cat >"$pkgdir/etc/default/tika-server" <<EOF
HOST=localhost
PORT=9998
EOF

  install -Dm0644 "tika-server-standard-$pkgver.jar" \
    "$pkgdir/usr/lib/tika-server/tika-server.jar"

  install -Dm644 "$srcdir/tika-server.service" \
    "$pkgdir/usr/lib/systemd/system/tika-server.service"
}
