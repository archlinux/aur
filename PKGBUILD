# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.23.7
pkgrel=1
pkgdesc='An ultra-lightweight and blazing-fast Messaging broker/bus for IoT edge & SDV'
url='https://nanomq.io'
arch=(x86_64 aarch64 armel armv7h)
license=(MIT)
depends=(gcc-libs)
provides=(nanomq)
conflicts=(nanomq)
makedepends=(libarchive)
backup=(etc/nanomq.conf)
install="${pkgname}.install"
noextract=("${pkgver}-"{x86_64,aarch64,armel,armv7h}".rpm")
source=(nanomq.service)
source_x86_64=("${pkgver}-x86_64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-x86_64.rpm")
source_aarch64=("${pkgver}-aarch64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-arm64.rpm")
source_armel=("${pkgver}-armel.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armel.rpm")
source_armv7h=("${pkgver}-armv7h.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armhf.rpm")
sha512sums=('7b86f32e35697f0f955f3d562637c5e067ac9b6691c7b6957d9106836445ffb75690530d72c5a0613519daaff7459ffbc776b2b3210d2a727053b097c8d950ee')
sha512sums_x86_64=('88d6b82a63c19acfc7431721b3e46f56c7af936717f985a06dcf57baf3c72adfd63d4334add3ee5371fdde8478bf5d518a77523c7b2d72771f2b679ad97352f8')
sha512sums_aarch64=('cb8349b7460e39f45b3635d6c723bf19c1795dcf5aaa2a6dddcce2b1f3447ed85a597740d56327ce0d794fac58055d43eef1fef52166db337e6dc7e33ec18802')
sha512sums_armel=('178d18b8472d7a7280fa03a0936ab39ea58fc9251e90c9d0e5eef367cd4d6804a1ef3e2d929beeedb34733df9ae5d47e9434bd7b030f60cc6b408746b471e9a1')
sha512sums_armv7h=('56cc22e2c68d6abb17ff460d6c8cc603539cd52eb6206d9410fb3324a51e38f0ed466eab7a28f526e8a7bc3abf0524219b0ef5a87affc7d53e8b2b2e493ed26b')

prepare() {
  rm -rf "${srcdir}/root"
  mkdir -p "${srcdir}/root"
  bsdtar -xf "${srcdir}/${pkgver}-${CARCH}.rpm" -C "${srcdir}/root"
}

package() {
  cd "${srcdir}/root"

  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/include" \
    "${pkgdir}/usr/lib" \
    "${pkgdir}/usr/lib/systemd/system" \
    "${pkgdir}/usr/share"

  cp -r \
    "usr/local/bin/" \
    "usr/local/include/" \
    "usr/local/lib/" \
    "usr/local/share/" \
    "${pkgdir}/usr/"

  cp usr/local/etc/nanomq.conf "${pkgdir}/etc/nanomq.conf"

  install -Dm 644 "${srcdir}/nanomq.service" -t "${pkgdir}/usr/lib/systemd/system"
}
