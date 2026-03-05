pkgname=x3dctl
pkgver=1.0.3
pkgrel=2
pkgdesc="Deterministic workload policy controller for AMD X3D processors"
arch=('x86_64')
url="https://github.com/GrandBIRDLizard/X3Dctl"
license=('MIT')
depends=('sudo')
makedepends=('gcc' 'make')
backup=('etc/x3dctl.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GrandBIRDLizard/X3Dctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a13f805286b2a6d1bd2cc7cf40ffef2d03f6c5b19819c1641ebd64af95a4477')

build() {
  cd "${srcdir}/X3Dctl-${pkgver}"
  make
}

package() {
  cd "${srcdir}/X3Dctl-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 etc/x3dctl.conf \
    "${pkgdir}/etc/x3dctl.conf"

  install -dm750 "${pkgdir}/etc/sudoers.d"
  install -m440 packaging/x3dctl.sudoers \
    "${pkgdir}/etc/sudoers.d/x3dctl"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
