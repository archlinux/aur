# Maintainer: Veitangie <emignatiev.work@gmail.com>

pkgname=sinq
_tag=v1.0.0-rc.12
pkgver=1.0.0_rc12
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
sha256sums=('2e3f8d4387ff61827a7ba3fe3ee67fa4f45e87f53fa732a9b45a3975951d75f4')

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
