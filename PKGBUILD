# Maintainer: Hao Long <aur@esd.cc>

pkgname=jaeles
pkgver=0.17
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
b2sums=('721a1fe3ef375675aeb59e7695023fe30d439b95e27c9219e7316c0ab2338c343d85e1df14d7ac2f08665731192226c0e003f7e1f8373b6fc7f9c4c4a211f164')

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
