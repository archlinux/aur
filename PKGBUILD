# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=1.0.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("gitleaks-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('44209ac919a03489a22f41e8bc588d9759dd587b14abaf09573c762590158ed4d42e1023b179fd00387ad0ec55d4c5353d68ce8578f29d4e2b9fe235ffcc91dd')

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
