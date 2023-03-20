# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=go-mod-upgrade
pkgver=0.9.1
pkgrel=1
pkgdesc='Update outdated Go dependencies interactively'
url='https://github.com/oligot/go-mod-upgrade'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oligot/go-mod-upgrade/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39d9a8bce860e49086cc45bf526d2e06f0f2ab7eac68c3af0d62d846782f3dfa')
b2sums=('0ebce17d33207f620ea1f4ae90b28f7d946ebeacacd392383b71138660560c6c50c115b998a61877d4e62c69b5242d8049e77cef13768faffc794206e7c1d976')

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
