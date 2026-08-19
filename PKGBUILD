# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=zx_go
pkgver=1.10.2
pkgrel=1
pkgdesc="A ZX Spectrum emulator written in Go"
arch=('x86_64')
depends=(libx11 alsa-lib opengl-driver)
makedepends=(go libxcursor libxrandr libxinerama libxi libglvnd)
url="https://github.com/conorarmstrong/zx_go"
license=('MIT')
options=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3de2f4578a57b13319ae4ed9ee6cb44f290ba85f7eee90cc80683f27c1d620fd')

build() {
   cd ${pkgname}-${pkgver}

   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export CGO_LDFLAGS="${LDFLAGS}"

   go build -o bin/zx_go ./cmd/zx_go
}

package() {
   install -m755 -d ${pkgdir}/usr/bin
   mv ${pkgname}-${pkgver}/bin/zx_go ${pkgdir}/usr/bin

   install -Dm644 ${pkgname}-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
