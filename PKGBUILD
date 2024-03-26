# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=falcosidekick
pkgver=2.28.0
pkgrel=1
pkgdesc="Connect Falco to your ecosystem"
arch=('x86_64')
url="https://github.com/falcosecurity/falcosidekick"
license=('MIT')
makedepends=('go' 'git' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bb9c3fc484514526c40174423a0ca26f38c3a26cd3c0b76b442598693cfc00ff')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make falcosidekick
}

check() {
  cd "$pkgname-$pkgver"
  export TEST_FLAGS="-v"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 falcosidekick "${pkgdir}/usr/bin/falcosidekick"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
