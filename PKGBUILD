# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>
pkgname=bombadillo
pkgver=2.4.0
pkgrel=1
pkgdesc="A non-web client for the terminal, supporting Gopher, Gemini and much more"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://${pkgname}.colorfield.space"
license=(GPL3)
depends=(glibc)
makedepends=(go)
source=(${pkgname}.tar.gz::https://tildegit.org/sloum/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('ce9ac62e2d57d98c6acca35b0a054a7920ad2ea8fa315b11c881057d30022f3417cf8132cfd1e6038410ca8aef9d430eb946ed803b62a4a52d2ac64f71dd3a1a')

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd ${pkgname}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}
  make VERSION="${pkgver}" DESTDIR="${pkgdir}/" PREFIX=/usr install
}
