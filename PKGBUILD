pkgname=x3dctl
pkgver=1.3.0
pkgrel=1
pkgdesc="Deterministic workload policy controller for AMD X3D processors"
arch=('x86_64')
url="https://github.com/GrandBIRDLizard/X3Dctl"
license=('MIT')
depends=('sudo')
makedepends=('make')
backup=('etc/x3dctl.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GrandBIRDLizard/X3Dctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d37bf75b04734d66bfac0cd4dd58e337264833e0c297254480870563a29f4fb')

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
