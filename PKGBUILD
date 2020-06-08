# Maintainer: Hao Long <aur@esd.cc>

pkgname=pkger
pkgver=0.17.0
pkgrel=1
pkgdesc="Embed static files in Go binaries"
arch=("x86_64" "i686")
url="https://github.com/markbates/pkger"
license=("MIT")
provides=('pkger')
conflicts=('pkger')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2a4593803004027257b1360022ae51d44a726b8881df92d315b353748c61d654')

build() {
  cd ${pkgname}-${pkgver}/cmd/${pkgname}
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 cmd/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
