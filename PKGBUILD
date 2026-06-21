# Contributor: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Contributor: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dgraph-bin
pkgver=25.3.6
pkgrel=1
#pkgdesc='Fast, transactional, distributed graph database'
pkgdesc='Dgraph is a horizontally scalable and distributed GraphQL database with a graph backend'
arch=(x86_64)
url='https://dgraph.io'
license=(Apache-2.0)
provides=('dgraph')
conflicts=('dgraph')
install="$pkgname.install"
_git='https://github.com/dgraph-io/dgraph'
_experimental='https://github.com/dgraph-io/dgraph-experimental'
source=("dgraph-$pkgver.tar.gz::$_git/releases/download/v$pkgver/dgraph-linux-amd64.tar.gz"
        "dgraph-$pkgver.tar.gz.sha256::$_git/releases/download/v$pkgver/dgraph-checksum-linux-amd64.sha256"
        "$_git/raw/v$pkgver/LICENSE.txt"
        "$_experimental/raw/shiva/contrib/dgraph-contrib/systemd/centos/add_dgraph_account.sh"
        "$_experimental/raw/shiva/contrib/dgraph-contrib/systemd/centos/dgraph-alpha.service"
        "$_experimental/raw/shiva/contrib/dgraph-contrib/systemd/centos/dgraph-zero.service"
        "$_experimental/raw/shiva/contrib/dgraph-contrib/systemd/centos/dgraph-ui.service")
sha256sums=('aa6162d5319087393f3f592600a953793f9014754c88684641f3e7424c8ece05'
            'fec50f48d31ce3c6c4147d5434683c4f2df4c5e15ac797ace8727697fd5ca125'
            'c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08'
            '3ae6aa66dc54919f3183ef0abec35ed11122f2ea49fa30c328b376a3fac69afd'
            'b0436225ea1b65e47cea0e4bc039bcf5c795330f352b6333a99e84f5bd000d23'
            '1d717b444a2bd4a6a5bfe035c8e46bba8319793f9ca211c3d815fa24327dc37f'
            '6403752fc7d99539236c6b6c81763b3a85a8ceb25959feddcd9f66a0adf8a77f')

package() {
  install -Dm755 dgraph -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 dgraph-alpha.service "$pkgdir/usr/lib/systemd/system/dgraph-alpha.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -Dm644 dgraph-ui.service "$pkgdir/usr/lib/systemd/system/dgraph-ui.service"
  install -Dm755 add_dgraph_account.sh "$pkgdir/usr/share/dgraph/add_dgraph_account.sh"
  install -Dm644 <(./dgraph completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/dgraph"
  install -Dm644 <(./dgraph completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_dgraph"
}
