# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=carveimg
pkgver=1.4.9
pkgrel=1
pkgdesc='Two image viewing utilities for the terminal, where one uses seam carving'
arch=(x86_64)
url='https://github.com/xyproto/carveimg'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('7d7dc60963fa34560a3757dbe9e5f4ca56bbc20d7492d186a5eb2444978b66dc15236b838a085ca9c282323baf6b17476b9992394b20ecb91009e2d24088a375')

build() {
  (cd $pkgname/cmd/img && go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"")
  (cd $pkgname/cmd/carve && go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\"")
}

package() {
  cd $pkgname
  install -Dm755 cmd/img/img "$pkgdir/usr/bin/img"
  install -Dm755 cmd/carve/carve "$pkgdir/usr/bin/carve"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
