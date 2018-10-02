# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=1.6.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("gitleaks-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('884724a904fdf01e1e0cb3d0dc627168bd93f19762e7212e1e0b0d6139ea67659d900ecd93fda97a9cf5c33486c75d699fb59e2945c7bde4b664022b8b5af96b')

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
