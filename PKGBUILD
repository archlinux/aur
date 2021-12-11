# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>

pkgname=dgraph-bin
pkgver=21.12.0
pkgrel=1
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
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('a8dc7f77ea89843f34d9466d212cadeb4a6f581e72c5d757e19f653e4863f8ef'
            '003b84232ffe706241c8b1276809ee353b832403ea239b3fd5ada91daefa9f90'
            'bfdc75136567068dd049c2d226049a57de5f4a1871eab7429c022e95952efb0d'
            '4772e7e65d4b314a5aee66930c7aa45ee6526e22f8dde3f8c6970cd23a6dac0c'
            '1d17f53b5f83f434ce918c1f13a7b5829b0c2d20ccad13aa44486a00d7b6bc6a'
            'cf80944157c7af97d0bcd18a6d4b5f6a4ba14941f47ff8b19977b7477ee2b865')

package() {
  cd "$srcdir"
  install -Dm644 DCL.txt "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  for binary in dgraph badger; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
}

# vim:set ts=2 sw=2 et:
