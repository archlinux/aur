# Maintainer: Hao Long <aur@esd.cc>

pkgname=jaeles
pkgver=0.14
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
sha256sums=('89e26e41675cae46684c7751b2a17b4744ea8b8424e5d26eab3af142fd3fea7c')

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
