# Maintainer: Yusuke Takahashi <yusuke@remote.it>
pkgname=remoteit
pkgver=3.0.2
pkgrel=0
pkgdesc="remote.it is a cloud service that provides secure connections."
url="https://remote.it"
license=('MIT')
arch=('x86_64')
depends=('grep>=2.1.6' 'curl>=7.21.0' 'nodejs>=10' 'jq' 'avahi')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=("connectd::https://downloads.remote.it/connectd/v4.12.0/connectd.x86_64-etch"
        "muxer::https://downloads.remote.it/multiport/v0.3-alpha/muxer.x86_64-ubuntu16.04"
        "demuxer::https://downloads.remote.it/multiport/v0.3-alpha/demuxer.x86_64-ubuntu16.04"
        "remoteit::https://downloads.remote.it/cli/v1.7.26/remoteit_linux_x86_64"
        "remoteit-headless.tgz::https://downloads.remote.it/desktop/v3.0.2/remoteit-headless.tgz"
        "avahi-alias@remoteit.local.service")
noextract=("remoteit-headless.tgz")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  install -d "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/connectd" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/muxer" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/demuxer" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/remoteit" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/remoteit-headless.tgz" "$pkgdir/usr/share/$pkgname/"
  install -m644 "$srcdir/avahi-alias@remoteit.local.service" "$pkgdir/usr/share/$pkgname/"
  echo {} | jq '.manufacturer.id = "remote.it" | .product.id = "33536" | .product.version = "3.0.2" | .product.platform = 769' > $pkgdir/usr/share/$pkgname/manufacturer.json
  chmod a+x $pkgdir/usr/share/$pkgname/connectd $pkgdir/usr/share/$pkgname/muxer $pkgdir/usr/share/$pkgname/demuxer $pkgdir/usr/share/$pkgname/remoteit
}
