# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-file
pkgver=0.3.0
pkgrel=2
pkgdesc="Common filesystem assertions for Bats"
arch=("any")
url="https://github.com/bats-core/bats-file"
license=("MIT")
depends=('bash-bats')
install=bash-bats-file.install
source=("https://github.com/bats-core/bats-file/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('948249ba72aa027153bdab55438e0b705c1efd06a934003ac60a51d839b0c91c0cb59b55260adcacfcaca9af5eed66c0c4197140aeb4db9dfbcc7ebed5cd4362')

check() {
   cd "${srcdir}/bats-file-${pkgver}"
   echo "tests contains sudo invocation, will avoid to run them"
   #TEST_DEPS_DIR="/usr/lib/" bats test
}

package() {
  cd "${srcdir}/bats-file-${pkgver}"

  for fn in *.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/bats-file/$(basename $fn)"
  done

  for fn in src/*.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/bats-file/src/$(basename $fn)"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
