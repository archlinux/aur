# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=23.0.0
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
        "badger-$pkgver.tar.gz::$url/releases/download/v$pkgver/badger-linux-amd64.tar.gz"
        "badger-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/badger-checksum-linux-amd64.sha256"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/licenses/DCL.txt"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "https://raw.githubusercontent.com/dgraph-io/dgraph/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('19d2e31ed3cf2c727977927d7e5742d50545ca4ece788152b5cacff77b6e9777'
            '3e49bfdd7f8e1a1867fea22242aed2c75463ba295cefb36003f4dd2f6857d3b9'
            '28476450da57e4f4a4fb6925ea3ffd7e1728bc32d4bace4b957cbee60a306e28'
            'a1cc0d92ce66c88dc5a4a8a9d70acd1807ed629974b03df8ac85aa37df93e3a7'
            'bfdc75136567068dd049c2d226049a57de5f4a1871eab7429c022e95952efb0d'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d17f53b5f83f434ce918c1f13a7b5829b0c2d20ccad13aa44486a00d7b6bc6a'
            'cf80944157c7af97d0bcd18a6d4b5f6a4ba14941f47ff8b19977b7477ee2b865')

package() {
  cd "$srcdir"
  mv badger-linux-amd64 badger
  install -Dm644 DCL.txt "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  for binary in dgraph badger; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
}

# vim:set ts=2 sw=2 et:
