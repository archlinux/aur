# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=png2svg
pkgver=1.5.3
pkgrel=1
pkgdesc='Utility for converting small PNG images to SVG'
arch=(x86_64)
url='https://github.com/xyproto/png2svg'
license=(BSD)
makedepends=(git go)
source=("git+$url#commit=1a004dd0e1e13a815a9e56fbfaba515c3d6ec8a1")
b2sums=(SKIP)

build() {
  cd $pkgname/cmd/$pkgname
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/cmd/$pkgname/$pkgname
}
