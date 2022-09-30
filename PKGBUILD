# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=liftbridge
pkgver=1.9.0
pkgrel=1
pkgdesc="Lightweight, fault-tolerant message streams."
arch=('x86_64')
url="https://liftbridge.io/"
license=('Apache-2.0')
makedepends=('go' 'make')
source=("https://github.com/liftbridge-io/liftbridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f39a32eceba12d841420d4e7a4ca21297247d6fd405f3ec3141c9815afce5dc')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 'liftbridge' "${pkgdir}/usr/local/bin/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  while IFS= \read -r -d '' FILE
  do
      install -Dvm644 "$FILE" -t "${pkgdir}/usr/share/doc/${pkgname}"
  done < <(\find documentation/ -type f -print0)
}

