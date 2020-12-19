# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.1.0
pkgrel=2
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('a49e597412a0be68020f2836c4f33276cb653d00543f59d4cff34b053b8d9a10')

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
