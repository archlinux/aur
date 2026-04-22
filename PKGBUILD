# Contributor: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Contributor: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=25.3.3
pkgrel=1
#pkgdesc='Fast, transactional, distributed graph database'
pkgdesc='Dgraph is a horizontally scalable and distributed GraphQL database with a graph backend'
arch=('x86_64')
url='https://dgraph.io'
license=('Apache-2.0' 'LicenseRef-DCL')
provides=('dgraph' 'badger' 'badgerdb')
conflicts=('dgraph' 'badger' 'badgerdb')
install="$pkgname.install"
_git='https://github.com/dgraph-io/dgraph'
source=("dgraph-$pkgver.tar.gz::$_git/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$_git/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "badger-$pkgver.tar.gz::$_git/releases/download/v$pkgver/badger-linux-amd64.tar.gz"
        "badger-$pkgver.tar.gz.sha256::$_git/releases/download/v$pkgver/badger-checksum-linux-amd64.sha256"
        "$_git/raw/v$pkgver/LICENSE.txt"
        "$_git/raw/v$pkgver/contrib/systemd/centos/dgraph-alpha.service"
        "$_git/raw/v$pkgver/contrib/systemd/centos/dgraph-zero.service"
        "$_git/raw/v$pkgver/contrib/systemd/centos/add_dgraph_account.sh")
sha256sums=('90494608eb21608d66ca702caa130ad6c33cadc2b29db4a7b7a506869e4fcac4'
            '8b5a9567d5c27131d4c1f85907656dca1bdd405954e2d958462b5bb49622753b'
            '2ff683a5ec437fe016a22e0b38053a2bbf80a2063af338743ea92c182bd0031a'
            'd4256ac6b06a96d76492f55fc6de527c8823f61d1382ad5b50063d40b8b56de7'
            'c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d717b444a2bd4a6a5bfe035c8e46bba8319793f9ca211c3d815fa24327dc37f'
            '3ae6aa66dc54919f3183ef0abec35ed11122f2ea49fa30c328b376a3fac69afd')

package() {
  install -Dm755 dgraph -t "$pkgdir/usr/bin/"
  install -Dm755 badger-linux-amd64 "$pkgdir/usr/bin/badger"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
  install -Dm644 <(./dgraph completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/dgraph"
  install -Dm644 <(./dgraph completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_dgraph"
  install -Dm644 <(./badger completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/badger"
  install -Dm644 <(./badger completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/badger.fish"
  install -Dm644 <(./badger completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_badger"
}

# vim:set ts=2 sw=2 et:
