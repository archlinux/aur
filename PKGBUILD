# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=go-mod-upgrade
pkgver=0.10.0
pkgrel=1
pkgdesc='Update outdated Go dependencies interactively'
url='https://github.com/oligot/go-mod-upgrade'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oligot/go-mod-upgrade/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('556fb443fc64dd8f62a7d702aab91ba483c30b3f5fa23c42c096948e697a7fe7')
b2sums=('b4ae1b66a5dfe981ae3fd8f886aee558942b0aaad49a004670484cd9ad2632960ca31e6e88d8c47aa815207eb3df52b01689b01293dc82646d17967a906d065c')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o go-mod-upgrade .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" go-mod-upgrade

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" License
}
