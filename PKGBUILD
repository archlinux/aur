# Maintainer: Carson Black <uhhadd@gmail.com>

pkgname=novatools
pkgnameupper=NovaTools
pkgver=0.1
pkgrel=1
pkgdesc='Nova Vita Repository Tools'
arch=('x86_64')
url="https://github.com/novavita/novatools"
license=('AGPL')
depends=('git')
makedepends=('go')
source=("https://github.com/novavita/NovaTools/archive/$pkgver.tar.gz")
sha256sums=('f2ffef6a47ff5c9230eb75c17d37590700bb9eef1ee681cf855f1d6189808f0b')

prepare(){
  cd "$pkgnameupper-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgnameupper-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "$pkgnameupper-$pkgver"
  go test ./...
}

package() {
  cd "$pkgnameupper-$pkgver"
  install -Dm755 build/nova "$pkgdir"/usr/bin/nova
}