# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kal
pkgver=1.3.0
pkgrel=1
pkgdesc='Colorful little calendar utility for getting a monthly overview'
arch=(x86_64)
url='https://github.com/xyproto/kal'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=f8fcb2793e65b745ec1a890249e5f6492ee87b57") # tag: v1.3.0
b2sums=('SKIP')

build() {
  cd kal/cmd/kal
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd kal
  install -Dm755 cmd/kal/kal "$pkgdir/usr/bin/kal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
