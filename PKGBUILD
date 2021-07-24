# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=sointu-track
pkgname=$pkgbase-git
pkgver=r471.60e4518
pkgrel=1
pkgdesc='4klang tracker'
arch=(x86_64)
url='https://github.com/vsariola/sointu'
license=(MIT)
makedepends=(git go)
source=("git+$url")
b2sums=(SKIP)

pkgver() {
  cd sointu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd sointu/cmd/$pkgbase
  go build -v -buildmode=pie -trimpath -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 sointu/cmd/$pkgbase/$pkgbase "$pkgdir/usr/bin/$pkgbase"
  install -Dm644 sointu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
