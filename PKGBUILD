# Maintainer: Kasei Wang <cnsdwpc at gmail.com>
_pkgname=kcptun
pkgname=$_pkgname-bin
pkgver=20161111
pkgrel=1
pkgdesc="An extremely simple udp tunnel based on KCP"
arch=("i686" "x86_64")
url="https://github.com/xtaci/kcptun"
license=("MIT")
depends=()
provides=("kcptun")
replaces=()
conflicts=("kcptun")

if [ "$CARCH" = "i686" ]; then
  _arch="386"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  md5sums=('7de2cafc0241f2e5ef035f7a0ba98997')
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="amd64"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  md5sums=('ce253b046f0da77b4967aa3aff1b2964')
fi
source+=('example_client.json'
         'example_server.json'
         'kcptun@.service'
         'kcptun-server@.service')
md5sums+=('a807ac981c0f99d6afea8a68459e2d64'
          '9946cc2e4556774defed6b35609b1665'
          'a6cb3e4490f9cc7be81fd4d898870040'
          'c5f96c4dae2dd65941d0e8dcbdbb88bd')

package() {
  cd "$srcdir/"
  install -Dm755 client_linux_$_arch "$pkgdir/usr/bin/kcptun_client"
  install -Dm755 server_linux_$_arch "$pkgdir/usr/bin/kcptun_server"
  install -Dm644 "$srcdir/example_client.json" "$pkgdir/etc/kcptun/example_client.json"
  install -Dm644 "$srcdir/example_server.json" "$pkgdir/etc/kcptun/example_server.json"
  install -Dm644 "$srcdir/kcptun@.service" "$pkgdir/usr/lib/systemd/system/kcptun@.service"
  install -Dm644 "$srcdir/kcptun-server@.service" "$pkgdir/usr/lib/systemd/system/kcptun-server@.service"
}
