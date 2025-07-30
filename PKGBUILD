# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.4.2
pkgrel=1
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(BSD)
depends=(git)
makedepends=(go)
source=("git+$url#tag=v$pkgver")
b2sums=('b3220cbb5bac42bcfa7615463539707177623815fcbccd9311be999e8e65f404196f5a97a1a1dbca0c3610d4c0eee6415397a27aa4a1990fc84570fb3da6a601')

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
