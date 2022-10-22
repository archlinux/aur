# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.2.0
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('1a0cb22ac1368891e98afdb9e4ebcf9f56eee8ccaaec3cf4777363aa0750c8695a0225db86f278aa57e59ba8e65d8bfc49877a9e80afd7d20ff889f0f9d4bcec')

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
