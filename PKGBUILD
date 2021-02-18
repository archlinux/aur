pkgname=smartied
pkgver=0.2
pkgrel=3
arch=('x86_64')
url="https://cgit.ctu.cx/smartied/"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="272acf3df0850ed5bab157b43b6d0bd4dffc4585"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('4341018fb3289e0840d081f31180bec5b27af98b9ab696146d6ab3f114a77cd2')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
