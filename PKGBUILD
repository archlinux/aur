# Maintainer: Jonne Haß <me@mrzyx.de>
pkgname=boxcars
pkgver=r59.2e02b6d
pkgrel=2
pkgdesc="Easy-to-configure Static Web & Reverse Proxy Server in Go"
arch=('x86_64' 'i686')
url="https://github.com/azer/boxcars"
license=('WTFPL')
makedepends=('git' 'go')
backup=("etc/boxcars.json")
options=('!strip' '!emptydirs')
source=('git://github.com/azer/boxcars.git' 'boxcars.service')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get github.com/azer/boxcars
  go get github.com/azer/boxcars/json-config
}

build() {
 cd "$srcdir/$pkgname/$pkgname"
 go build -o $pkgname boxcars.go
}

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/example.json" "$pkgdir/etc/${pkgname}.json"
  install -Dm644 "${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP'
            '9261145e259f0c3ac2a69983f9e8671b967af9da6043723eaf1ccbe64e132ed5')
