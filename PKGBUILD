# Contributor: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Contributor: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=25.3.0
pkgrel=1
#pkgdesc='Fast, transactional, distributed graph database'
pkgdesc='Dgraph is a horizontally scalable and distributed GraphQL database with a graph backend'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('Apache-2.0' 'custom:DCL')
provides=('dgraph' 'badgerdb')
conflicts=('dgraph' 'badgerdb')
install="$pkgname.install"
source=("dgraph-$pkgver.tar.gz::$url/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "badger-$pkgver.tar.gz::$url/releases/download/v$pkgver/badger-linux-amd64.tar.gz"
        "badger-$pkgver.tar.gz.sha256::$url/releases/download/v$pkgver/badger-checksum-linux-amd64.sha256"
        "$url/raw/v$pkgver/licenses/DCL.txt"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "$url/raw/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('6f396b03c216af4b61a709c6ae6bb447ab125de29bf6e365693f23320efc0b8a'
            'fe9aa024cff2ec4a11f5ada231a4df7c59159b69009487a227fe57f33ac38678'
            '56bac56de02dc9e6f8da0f93cedbae0356d50af17e97748d97aca76338518eee'
            'a3206be0d02663940f7bc1dec13f4dfc5a6a64a1549a645755320c439c4434f6'
            '5f245e21547ee20c65bde76a0b1db995a7dbfdd30f99de861036672cdebfb395'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d717b444a2bd4a6a5bfe035c8e46bba8319793f9ca211c3d815fa24327dc37f'
            '3ae6aa66dc54919f3183ef0abec35ed11122f2ea49fa30c328b376a3fac69afd')

package() {
  cd "$srcdir"
  install -Dm755 dgraph "$pkgdir/usr/bin/dgraph"
  install -Dm755 badger-linux-amd64 "$pkgdir/usr/bin/badger"
  install -Dm644 DCL.txt "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
  install -Dm644 <(./dgraph completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/dgraph"
  install -Dm644 <(./dgraph completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_dgraph"
}

# vim:set ts=2 sw=2 et:
