pkgname=smartied
pkgver=0.2
pkgrel=5
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="e06836e456ffd78621d9eed466348aa765a2f53f"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('10407efb9f1c6b80a4d1706fb25528992d69f85753f0cc2b3b2e0ec4cd059461')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
