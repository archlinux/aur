# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.4.3
pkgrel=1
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(BSD)
depends=(git)
makedepends=(go)
source=("git+$url#tag=v$pkgver")
b2sums=('e0249b2b2abda5ba3b35a83c5cc745a2d0a497f461d2bbceb06271b32995645a5526c128f6a1d3ed0694013f40f84de4ce10666fe08561979dfb7140de33f623')

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
