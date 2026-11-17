# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=go-mod-upgrade
pkgver=0.13.0
pkgrel=1
pkgdesc='Update outdated Go dependencies interactively'
url='https://github.com/oligot/go-mod-upgrade'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oligot/go-mod-upgrade/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d1542421e346b855cbe1f997eb917b47afc0d03845e6f91b604eb7855172fb1')
b2sums=('03669ebd55ac1fb9ef9ed77e707f716b158608ffa71a6d84653b18175bc2e2b2c89a86357e9b91579410f83da6c4f11b8d6b2df96311be89a5a1fcd36c7dac74')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" -o go-mod-upgrade .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" go-mod-upgrade

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" License
}
