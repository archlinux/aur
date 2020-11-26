# Maintainer: Hao Long <aur@esd.cc>

pkgname=jaeles
pkgver=0.15
pkgrel=1
pkgdesc='The Swiss Army knife for automated Web Application Testing'
arch=('x86_64' 'i686')
url="https://github.com/jaeles-project/jaeles"
license=('MIT')
provides=('jaeles')
conflicts=('jaeles')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/beta-v${pkgver}.tar.gz")
sha256sums=('7deb682012ad1af8634e2040452c084a18fb0711b8ffa661d42bada9393ad99a')

build() {
  cd ${pkgname}-beta-v${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd ${pkgname}-beta-v${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
