# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=slicer
pkgdesc="A tool to automate the boring process of APK recon"
pkgver=1.4
pkgrel=1
arch=('x86_64')
url="https://github.com/mzfr/slicer"
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8b4c74685f841ba588ff09d292a9fedda296aad37037c7ba5982cb2d4adabac7b36beae66dc880cd5654d474034961544f61da5fd87857ee55e8809de1f46a6a')

build() {
  cd "$pkgname-$pkgver"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
