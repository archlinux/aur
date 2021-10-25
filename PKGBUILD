# Maintainer: Wallun <wallun@disroot.org>
pkgname=prometheus-libvirt-exporter
pkgver=1.2.0
pkgrel=2
pkgdesc="A prometheus exporter for libvirt"
arch=('x86_64')
url="https://github.com/zhangjianweibj/prometheus-libvirt-exporter"
options=()
license=(MIT)
depends=()
optdepends=()
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz"
        prometheus-libvirt-exporter.service)
sha256sums=('f73940ebf884f26001151be085fe7a04e4f83b097b9344d67b1751bf7a9ddc46'
            'b31552e3ce21a5c5e4e683b78e2fb4be0c1f56378271b14e1b39e925d0913085')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -D -m0775 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}"\
    "${pkgdir}/usr/bin/${pkgname}"

  # Install systemd service file
  install -D -m0644 "${srcdir}/${pkgname}.service" \
   "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
