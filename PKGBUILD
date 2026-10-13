# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=metatar
pkgver=1.9.4
pkgrel=1
pkgdesc='Create root filesystems without fakeroot'
arch=(x86_64)
url='https://github.com/xyproto/metatar'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('ae02bb5ab2cb235cb94a0ad8714a4b3a217dc58c4b0e1f6111ebada91e6926ff58ab53f77a417fde70c87a59c2f7c4f9fba76bf80aac36b8b626a6ffd0b08586')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
