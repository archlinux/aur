# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=imgproxy
pkgdesc="Fast and secure standalone server for resizing and converting remote images"
pkgver=3.23.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/imgproxy/imgproxy"
license=('MIT')
depends=('libvips>=8.10')
makedepends=('go' 'rsync')
source=("https://github.com/imgproxy/imgproxy/archive/v${pkgver}.tar.gz")
sha256sums=('d48721d96bf2974af4b6e612d0cdb27484d132c9f9ad17abe5c2095f22beeb8d')

build() {
  cd "$pkgname-$pkgver"
  env CGO_LDFLAGS_ALLOW="-s|-w" go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}