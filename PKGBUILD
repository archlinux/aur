# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>

pkgname=dgraph-bin
pkgver=20.11.3
pkgrel=2
pkgdesc='Fast, transactional, distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE' 'custom:DCL')
provides=('dgraph')
conflicts=('dgraph' 'dgraph-git')
install=$pkgname.install
source=("dgraph-$pkgver.tar.gz::$url/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/licenses/DCL.txt"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/dgraph-ui.service"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('219501ab5f2af863d12bc55f3860fa12df2127a07ac8eaf998ca646fc720d94e'
            '52f84328e51160f1a9b4f44dada9118bc6f6ff3d7ab6edd5491abfacc328fc2b'
            'bfdc75136567068dd049c2d226049a57de5f4a1871eab7429c022e95952efb0d'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d717b444a2bd4a6a5bfe035c8e46bba8319793f9ca211c3d815fa24327dc37f'
            '6403752fc7d99539236c6b6c81763b3a85a8ceb25959feddcd9f66a0adf8a77f'
            'cf80944157c7af97d0bcd18a6d4b5f6a4ba14941f47ff8b19977b7477ee2b865')

package() {
  cd "$srcdir"
  install -Dm644 DCL.txt "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  for binary in dgraph dgraph-ratel badger; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm644 dgraph-ui.service "$pkgdir/usr/lib/systemd/system/dgraph-ui.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
}

# vim:set ts=2 sw=2 et:
