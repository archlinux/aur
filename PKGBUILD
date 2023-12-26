# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-detik
pkgver=1.2.1
pkgrel=3
pkgdesc="A library to ease e2e tests of applications in K8s environments with bats"
arch=("any")
url="https://github.com/bats-core/bats-detik"
license=("MIT")
depends=('bats')
install=bash-bats-detik.install
source=("https://github.com/bats-core/bats-detik/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7651de66ab890a82597c23bd081e0779b1644dce34211597e890d6f8d3b46d859258081c4287120f55cdf17ef5a5c83ad79917badcc2a9797c5bd59fefa291b7')

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
