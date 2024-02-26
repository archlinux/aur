# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-detik
pkgver=1.3.0
pkgrel=1
pkgdesc="A library to ease e2e tests of applications in K8s environments with bats"
arch=("any")
url="https://github.com/bats-core/bats-detik"
license=("MIT")
depends=('bats')
install=bash-bats-detik.install
source=("https://github.com/bats-core/bats-detik/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('db186eec55854131f8b89043033ab7fb9c43ce24ae3b02c792d82ce182fe4f17f14b303079811a1b8d024fd35da914dd949c1450f339f9f1043d40edb1c55d97')

check() {
   cd "${srcdir}/bats-detik-${pkgver}"
   bats tests
}

package() {
  cd "${srcdir}/bats-detik-${pkgver}"

  for fn in lib/*.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/bats-detik/$(basename $fn)"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
