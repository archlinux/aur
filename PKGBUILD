# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-detik
pkgver=1.3.3
pkgrel=3
pkgdesc="A library to ease e2e tests of applications in K8s environments with bats"
arch=("any")
url="https://github.com/bats-core/bats-detik"
license=("MIT")
depends=('bats')
install=bash-bats-detik.install
source=("https://github.com/bats-core/bats-detik/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4834d9724776b4bf7adab44285bbc335bab2de9114feac3e4dac478e5ddbcc43eab927d340be6b5f09b0bffaa7dfdae337eca0095353213fa28eac8669fcb8d8')

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
