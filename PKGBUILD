# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Aaron Blair <aaron@aaronpb.me>

pkgname=gobuster
pkgver=3.4.0
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('e553e477389c90af462eb2dc9deeba2f83832be11c999c4f2dfa2defb8c10296b011c6073def85d90461c5b64f21984e02925855ffffd3d52de855bdf6c66e1a')

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
