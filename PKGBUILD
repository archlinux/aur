# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=1.6.1
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("gitleaks-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('74c908f2489be4847de45071788f8d8d5facf0ba7374274aadd796d9ab75980616089a0afeb74cb025a37851fd7dd268c8848a6a98e0a8754975f314977bc153')

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
