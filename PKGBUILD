# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=1.12.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("gitleaks-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6e111b1cbfba112e37a8730f61a2107167ded5012509743936fd644be407e7d7a447a864891225a595820a1389e744b2c93f099117f9f88ddb2d015dfdd26f49')

prepare() {
  mkdir -p src/github.com/zricethezav
  ln -rsnf gitleaks-$pkgver src/${url#*//}
}

build() {
  cd src/${url#*//}
  export GOPATH="$srcdir"
  go build -v
}

package() {
  cd gitleaks-$pkgver
  install -Dm755 gitleaks "$pkgdir"/usr/bin/gitleaks
}

# vim:set ts=2 sw=2 et:
