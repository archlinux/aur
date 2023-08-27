# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=bash-bats-file
pkgver=0.4.0
pkgrel=2
pkgdesc="Common filesystem assertions for Bats"
arch=("any")
url="https://github.com/bats-core/bats-file"
license=("MIT")
depends=('bash-bats')
install=bash-bats-file.install
source=("https://github.com/bats-core/bats-file/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('373262eb0dd01b9a46ab6f74e74f8cca867048fc757ad48126b7aa26ba173989e77c3ae9007e1bbe646f4f461fcd1c2be6e60b3a55242ae4b73f41d42c323bb6')

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
