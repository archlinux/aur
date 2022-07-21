# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=1.2.1
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=(x86_64)
url='https://elfinfo.roboticoverlords.org/'
license=(BSD)
makedepends=(go git)
source=("git+https://github.com/xyproto/elfinfo#commit=0f5a6d671c6d298e7f06d2917a2007e9a547d2ad") # tag: 1.2.1
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
