pkgname=smartied
pkgver=0.2
pkgrel=7
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="0bbb57b5ce6e7b58cf616a39d72cc3fabd3cb8c7"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('11a033bf57a3b41839ccc1fddd29ac7d85b8d5300f2d921f7d6770a5b7e7f18f')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
