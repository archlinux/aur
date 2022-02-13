# Mainintainer : Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=upcmd
pkgver=20220112
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/upcmd/up"
arch=('x86_64')
provides=('up')
depends=('glibc')
provides=('upcmd')
makedepends=('go')
source=("up-rolling-${pkgver}.tar.gz::${url}/archive/refs/tags/rolling-${pkgver}.tar.gz")
sha256sums=('109d24eabb444ba738ac102b4af65e5900ef5635044c5c7fe15bba801503f70e')

build() {
  cd "up-rolling-${pkgver}"
  rm -rf build
  mkdir -p ./build/linux
  GOOS=linux GOARCH=amd64 go build -o build/linux/up app/up/*.go
}

package() {
  cd "up-rolling-${pkgver}"
  install -Dm755 ./build/linux/up "$pkgdir/usr/bin/upcmd"
}
