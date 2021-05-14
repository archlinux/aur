pkgname=smartied
pkgver=0.2
pkgrel=14
arch=('x86_64')
pkgdesc="smarthome server"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="6b0b4163a30caf95468f1bf724b53b9e02344b29"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('baa5403c06668869e8c8d5a64254910e38cb8b1a816c58d9642ad12e51cf9f97')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
