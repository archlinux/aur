# Maintainer: Wallun <wallun@disroot.org>
pkgname=prometheus-libvirt-exporter
pkgver=1.2.0
pkgrel=1
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
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver}"
        prometheus-libvirt-exporter.service)
sha256sums=('SKIP'
            'SKIP')

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
