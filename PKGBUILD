pkgname=fritzbox-exporter
pkgver=0.1
pkgrel=0
arch=('x86_64')
pkgdesc="prometheus exporter for lte fritzboxes"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'nim' 'nimble' )
_commit="fac404da464bae683f68e9951061623a852af35a"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('e54dc049a3ca7689ea28ea1bdfb5d86024e0ee2fad00109d6fdd41ea1037c3e8')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -Dm755 ./fb_exporter "$pkgdir"/usr/bin/fb_exporter
  install -Dm755 ./fritzbox-exporter.service "$pkgdir"/usr/lib/systemd/system/fritzbox-exporter.service
}
