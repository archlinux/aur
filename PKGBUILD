pkgname=smartied
pkgver=0.2
pkgrel=12
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="a9f304c83c93780ebb8772bd250bf53fc2b157a6"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('1127878f7224e895b5cd5a6c7d8625a80ebbe27da1f1694103108eb53b86fc0f')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
