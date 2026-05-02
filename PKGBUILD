# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=arrowkeyoracle
pkgver=1.0.2
pkgrel=1
pkgdesc='Predict if the user is going to press the left or the right arrow key'
arch=(x86_64)
url='https://github.com/xyproto/arrowkeyoracle'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('3d5cfa60f97ceeaea4962c4fbf138b5bcee536d1e0b167256ee43485b90061626dba431518e5971c39cc22c71d50e1d1ba53f94ef66bdfc881b35bc4c4a10f43')

build() {
  cd $pkgname
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags="-s -w -linkmode=external -extldflags '$LDFLAGS'"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
