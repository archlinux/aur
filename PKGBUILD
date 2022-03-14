# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=imgproxy
pkgdesc="Fast and secure standalone server for resizing and converting remote images"
pkgver=3.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/imgproxy/imgproxy"
license=('MIT')
depends=('libvips>=8.10')
makedepends=('go' 'rsync')
source=("https://github.com/imgproxy/imgproxy/archive/v${pkgver}.tar.gz")
sha256sums=('69a9008577b1d425fe05f9d3646b51c2eb35bb267ba325e95c14ad10a04bd1d2')

build() {
  cd "$pkgname-$pkgver"
  env CGO_LDFLAGS_ALLOW="-s|-w" go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}