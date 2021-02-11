pkgname=serial2tcp
pkgver=0.1
pkgrel=0
arch=('x86_64')
url="https://cgit.ctu.cx/serial2tcp/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'nim' 'nimble' 'git' )
_commit="ef1ea798224b912aa3cee213bdf91bb362fa05ea"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('2625c849b495bdb106e604143af2ed691b820885273a78ee41881fbee167ddf9')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -d:nimWorkaround14447 -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./serial2tcp "$pkgdir"/usr/bin/serial2tcp
  install -Dm755 ./serial2tcp@.service "$pkgdir"/usr/lib/systemd/system/serial2tcp@.service
}
