# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.4.1
pkgrel=1
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(BSD)
depends=(git)
makedepends=(go)
source=("git+$url#tag=v$pkgver")
b2sums=('8446c06ad85ee7e98c1475799b15d79dc8ed57640c47c71174f864730b9ce18496635550105e6223b33772c84328dfd065fce2dd52a643b1a0b108ce58294667')

build() {
  cd $pkgname
  export LDFLAGS="$(echo $LDFLAGS | sed 's/ -Wl//g;s/,--sort-common//')"
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags="-s -w -linkmode=external -extldflags '$LDFLAGS'"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
