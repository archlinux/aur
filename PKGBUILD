# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=cliwt
pkgdesc='CLI ASCII avatar for entertainment and motivational purposes'
pkgver=1.0.1
pkgrel=1
arch=(x86_64)
license=('GPL-3.0-only')
url='https://github.com/HenryLoM/CliWaifuTamagotchi/'
depends=("glibc")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HenryLoM/CliWaifuTamagotchi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7b937fbe6d19eda003233f13ed5578243848bb4ca00c41deb1bd21593c59dc2')

prepare() {
  cd "CliWaifuTamagotchi-${pkgver}"
  mkdir -p build
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "CliWaifuTamagotchi-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/cliwt .
}

package() {
  cd "CliWaifuTamagotchi-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
