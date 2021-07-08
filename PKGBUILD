# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=imgproxy
pkgdesc="Fast and secure standalone server for resizing and converting remote images"
pkgver=2.16.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/imgproxy/imgproxy"
license=('MIT')
depends=('libvips')
makedepends=('go' 'rsync')
source=("https://github.com/imgproxy/imgproxy/archive/v${pkgver}.tar.gz")
sha256sums=('568ee735217d1b2b774b7d7c4d22492c117312cc7c8eec16faa5fd35ce9a7080')

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