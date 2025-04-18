# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=1.2.3
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=(x86_64)
url='https://elfinfo.roboticoverlords.org/'
license=(BSD)
makedepends=(go git)
source=("git+https://github.com/xyproto/elfinfo#tag=v$pkgver")
b2sums=('5005a91efaf74dd85efafa11c3816ba8a590ceb5d2704e87d6f0382481158b57609d75b9180733210c1e6dc5caf8f3b13b9778f53a4e8442f3767c8e35a044a0')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags '${LDFLAGS}'"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
