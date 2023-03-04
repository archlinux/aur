# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.5.0
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('06002e2f5bf05a0779e2bc667bb58f12cd1d09fb2e2473d2ab1ff69bb608efe6d724a4ed1db2da10cda1434b966af8cac3ffb4d45ab3fa1ea7d1ec54d62fbfc6')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 gobuster ${pkgdir}/usr/bin/gobuster
}
