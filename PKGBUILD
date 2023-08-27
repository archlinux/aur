# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.6.0
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('404f506898272cc3c20f849ddfcd5b1f8be2e7ca6f8d1a8beb067dbe7aee2a85b59a84fd34699482715cc83639d589703bb9588301a970b5edaf87bbed1627b4')

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
