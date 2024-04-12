# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=jj-git
pkgver=1.9.2.r3.gab3eb1e
pkgrel=1
pkgdesc="JSON Stream Editor (command line utility)"
arch=('x86_64')
url="https://github.com/tidwall/jj"
license=('MIT')
makedepends=('git' 'go')
provides=('jj')
conflicts=('jj')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}


build() {
  cd "$pkgname"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external"
  go build -ldflags "-X main.version=$pkgver" -o jj cmd/jj/main.go
}

package() {  
  cd "$pkgname"
  install -Dm755 jj "$pkgdir/usr/bin/jj"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
