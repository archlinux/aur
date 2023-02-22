# Maintainer: yunielrc87 <yunielrc87[at]gmail[dot]com>
pkgname=bash-bats-assert-git
pkgver=2.1.0
pkgrel=1
pkgdesc="Common assertions for Bats"
arch=('any')
url="https://github.com/bats-core/bats-assert"
license=('CCPL')
depends=('bash-bats')
install="$pkgname.install"
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd')

pkgver() {
  git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags "$url" '*.*.*' | tail -n 1 | cut -d '/' -f 3 | sed 's/^v//'
}

check() {
  cd "bats-assert-${pkgver}"
  echo "tests contains sudo invocation, will avoid to run them"
  #TEST_DEPS_DIR="/usr/lib/" bats test
}

package() {
  cd "bats-assert-${pkgver}"

  for fn in *.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/${pkgname}/$(basename $fn)"
  done

  for fn in src/*.bash; do
    install -Dm755 ${fn} "${pkgdir}/usr/lib/${pkgname}/src/$(basename $fn)"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
