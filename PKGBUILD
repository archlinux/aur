# Maintainer: Alexander <xyproto@archlinux.org>

pkgname=flapc
pkgver=1.0.0
pkgrel=1
pkgdesc='The Flap compiler'
arch=(x86_64)
url='https://github.com/xyproto/flapc'
license=(BSD3)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('9a24e2e95285aa66f351756b1801942dcfb7a69a216c1a0571f8cf46f5c5a22c0c49da82bfda569d057cb48ab8eee5797789f6b0f25b7e859fefd24fa1799621')

prepare() {
  # Fix a typo that has been fixed in main
  sed -i 's/\\n/;/g' $pkgname/flapc.1
}

build() {
  cd $pkgname
  go build -v -mod=vendor -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm755 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
