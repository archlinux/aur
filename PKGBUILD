pkgname=smartied
pkgver=0.2
pkgrel=0
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="583f9b189f449a53d74c586c0737eb96b8dbd7d5"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('b42cf3ba1d5e096d0277d4b0831131c0459badf4945a92d15ffecd6971afb493')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
