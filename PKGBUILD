# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kal
pkgver=1.3.1
pkgrel=1
pkgdesc='Colorful little calendar utility for getting a monthly overview'
arch=(x86_64)
url='https://github.com/xyproto/kal'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('a6687d0625e3122e64aed97f0cd4d33f1af5a47aa61434c647ab2d944d490424f13ed3481c310e210758f25126275299a407c86ab21f421707a7382035a17974')

build() {
  cd kal/cmd/kal
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd kal
  install -Dm755 cmd/kal/kal "$pkgdir/usr/bin/kal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
