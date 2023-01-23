# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=1.2.2
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=(x86_64)
url='https://elfinfo.roboticoverlords.org/'
license=(BSD)
makedepends=(go git)
source=("git+https://github.com/xyproto/elfinfo#commit=c222ef706cd6216e5f3d2aca297f2369895beed7") # tag: 1.2.2
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags '${LDFLAGS}'"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
