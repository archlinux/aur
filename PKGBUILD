pkgname=serial2tcp
pkgver=0.1
pkgrel=1
arch=('x86_64')
pkgdesc="serial to tcp/ip bridge"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="82ba5985f8546f8cf2350918163418218eac9d0c"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('35c80e84c1e35555c693ba0a644aaac176c0aa387d8f4c104101583aa8819eb2')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -d:nimWorkaround14447 -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./serial2tcp "$pkgdir"/usr/bin/serial2tcp
  install -Dm755 ./serial2tcp@.service "$pkgdir"/usr/lib/systemd/system/serial2tcp@.service
}
