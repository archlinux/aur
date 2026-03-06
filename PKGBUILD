pkgname=x3dctl
pkgver=1.1.2
pkgrel=1
pkgdesc="Deterministic workload policy controller for AMD X3D processors"
arch=('x86_64')
url="https://github.com/GrandBIRDLizard/X3Dctl"
license=('MIT')
depends=('sudo')
makedepends=('make')
backup=('etc/x3dctl.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GrandBIRDLizard/X3Dctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8314133109374a65c1695268fb66591a4bfdbfcbec2b8110687802d4b0f880a9')

build() {
  cd "${srcdir}/X3Dctl-${pkgver}"
  make
}

package() {
  cd "${srcdir}/X3Dctl-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 etc/x3dctl.conf \
      "${pkgdir}/etc/x3dctl.conf"

  install -Dm644 LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
