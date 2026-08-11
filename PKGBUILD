# Maintainer: Veitangie <emignatiev.work@gmail.com>

pkgname=sinq
_tag=v1.0.0-rc.24
pkgver=1.0.0_rc.24
pkgrel=1
pkgdesc='A concurrent HTTP functional and integration testing tool.'
arch=('x86_64' 'aarch64')
url="https://github.com/Veitangie/sinq"
license=('GPL3')
provides=('sinq')
conflicts=('sinq-bin' 'sinq-git')
options=('!debug')
depends=()
makedepends=('go' 'go-md2man')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Veitangie/sinq/archive/refs/tags/$_tag.tar.gz")
sha256sums=('b8b5ac989c3c3670cdf3e45ab97bc5e896fc3093bbbf15c50ce1228c4a878ee4')

build() {
  cd "$pkgname-${_tag#v}"
  
  export CGO_ENABLED=0
  
  go build -trimpath -ldflags="-s -w -X 'main.versionConstPart=sinq $_tag - '" -o $pkgname ./cmd/$pkgname
  
  go-md2man -in docs/man.md -out sinq.1
}

package() {
  cd "$pkgname-${_tag#v}"
  
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  install -Dm644 sinq.1 "$pkgdir/usr/share/man/man1/sinq.1"
}
