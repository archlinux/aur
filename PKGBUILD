# Maintainer: hev <git@hev.cc>

pkgname=sockstun
pkgver=2.13.0
pkgrel=1
pkgdesc="A high-performance and low-overhead tunnel over socks5 proxy (tun2socks)."
arch=('x86_64')
url="https://github.com/heiher/hev-socks5-tunnel"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/heiher/hev-socks5-tunnel.git#tag=${pkgver}"
        'sockstun@.service'
        'sockstun.yml')
sha256sums=('SKIP'
            'b86c79a0e890cc7b9007f1dadb7a5b7c74d78e6fbcb03390a0299aaf176eb6c2'
            '3af0a120f958cbb6cdb79507028d3ade94f93cbb20bda74f52620ecc3a0c3e58')

prepare() {
  cd $pkgname
  git submodule init
  git submodule update
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 "$srcdir"/"$pkgname"/bin/hev-socks5-tunnel "$pkgdir"/usr/bin/sockstun
  install -Dm644 "$srcdir"/sockstun@.service "$pkgdir"/usr/lib/systemd/system/sockstun@.service
  install -Dm644 "$srcdir"/sockstun.yml "$pkgdir"/etc/sockstun.yml
}
