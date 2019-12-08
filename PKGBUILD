# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=flucky
pkgver=v0.1.0.r15.gb125bf4
pkgrel=2
pkgdesc='A  lightweight golang program to read values from different sensors'
arch=('x86_64' 'armv6h' 'armv7h')
url=https://github.com/volker-raschek/flucky
license=('Apache 2.0')
makedepends=('docker' 'make')
source=('git+https://github.com/volker-raschek/flucky')
sha256sums=('SKIP')

pkgver(){
  cd flucky
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make container-run/flucky
}

package() {
  install -Dm4755 "${srcdir}/${pkgname}/flucky"  "$pkgdir/usr/bin/flucky"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}