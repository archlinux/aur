pkgname=smartied
pkgver=0.2
pkgrel=13
arch=('x86_64')
pkgdesc="smarthome server"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
depends=( 'glibc' 'libmodbus' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="7abfbb2009484506e51c6d67446e24405fda5161"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('ba28fd3b194244a6178eab204d4960d33da5968b3b00c8f3cdfef789aaa96256')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./smartied "$pkgdir"/usr/bin/smartied
  install -Dm755 ./smartied.service "$pkgdir"/usr/lib/systemd/system/smartied.service
}
