# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=metatar
pkgver=1.9.3
pkgrel=1
pkgdesc='Create root filesystems without fakeroot'
arch=(x86_64)
url='https://github.com/xyproto/metatar'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('b3e6e1eaa88b1d15ad86721f4bdd9c23cb027d775eb4fa0fe0f1fbe34c4ac9230e64133a1e37a58cdf973d4cb343365962ae7c01d3b0504253109ba2748f00ab')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
