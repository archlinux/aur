# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-detik
pkgver=1.3.2
pkgrel=3
pkgdesc="A library to ease e2e tests of applications in K8s environments with bats"
arch=("any")
url="https://github.com/bats-core/bats-detik"
license=("MIT")
depends=('bats')
install=bash-bats-detik.install
source=("https://github.com/bats-core/bats-detik/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b0f26f81541ff0e0032e7e74d4a524cd035ca976410bcbde94ceb39776aa73481a620649a30f157a0f33670e68b6bbc3449256bae9a087f4fa7d062a22e8e346')

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
