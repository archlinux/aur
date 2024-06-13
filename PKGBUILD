# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-detik
pkgver=1.3.1
pkgrel=3
pkgdesc="A library to ease e2e tests of applications in K8s environments with bats"
arch=("any")
url="https://github.com/bats-core/bats-detik"
license=("MIT")
depends=('bats')
install=bash-bats-detik.install
source=("https://github.com/bats-core/bats-detik/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('49c78136f0be9f8a556cb8cca705302e7b599d95657c734b74df72da765e65399bd02071ecceb24f1097e1db40cd1bebd87b2428b2da07ca547f644a5e462c2d')

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
