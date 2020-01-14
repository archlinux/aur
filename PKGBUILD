# Maintainer: buckket <felix@buckket.org>

pkgname=pkgproxy
pkgver=1.0.1
pkgrel=3
pkgdesc='pkgproxy is a caching proxy server for usage with pacman'
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/buckket/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz" "pkgproxy.service")
sha256sums=('9b439b9a0f653b788ccc73a49b7dac31b236c9130c48bed1bf465248e3a50bd9'
            '2c8ca0036aa5dd42d66605cb3a9e02abd33500840be5536579b522592881e7fb')

build() {
  cd ${pkgname}-${pkgver}
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ../pkgproxy.service
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
