# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=1.1.1
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("gitleaks-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9892a820fdf281bdfb05585019e30d1d613b2ebfe189fdb111ad6f0119bfb84d0ea18afac37cf516d23f3c494644319f2d6edf397be4fee8ef7959359389da49')

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
