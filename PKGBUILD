# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=coredns
pkgver=1.8.6
pkgrel=2
pkgdesc="A DNS server that chains plugins"
makedepends=('go' 'make')
conflicts=('coredns-bin')
arch=('any')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns-${pkgver}.tar.gz::https://github.com/coredns/${pkgname}/archive/v${pkgver}.tar.gz
coredns.service
coredns-sysusers.conf)

sha256sums=('cbe3764afe2148b8047ea7e5cbba5108c298dee3a9a0391028e2980e35beaa2b'
            '030cd8e938c293c11a9acdb09b138f98b37874772072336792ec4bf0d9eff9b1'
            '536d03f8b20b0d2d6e8f96edd7e4e4dd7f6fef39ab0e952522d8725f3cc186b7')

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  cd coredns-$pkgver
  make coredns
}

package() {
  install -Dm755 "$srcdir/coredns-$pkgver/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
}
