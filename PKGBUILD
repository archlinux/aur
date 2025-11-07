# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.24.5
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
sha512sums_x86_64=('dc6d8811a0bfc57ddfa0cffe9b41ae8397d0b3f30457a98aa4f0768ac7765fcdd58b0696c4c7996018934fde9840ee20de0b43d072f3e3f995fad32d4dd2c5e5')
sha512sums_aarch64=('0ba46f63bdc0b84a48749825b5744bf9512594c12f9279982f170c7b8e9fdad8cc0b02b9b23c5b0dbce386e89bf1082d6d1abfa179e346d59a697aa1c03fd913')
sha512sums_armel=('25670d7ba46b9e940358e9b574780ed532f05e0636d127caa8ba5a5595153cec737ee00f59161d1528ee324018a786da460fde654467fa4b7946a90d6d86683d')
sha512sums_armv7h=('50729a48e9bffcdbf85c2843396eac9989ea8aaf540cf321e8e4ad2a49899f6850649e4e9842f6cccc3a4a11c9f121176140d25ac48cc41c7c2b77729c1d38f5')

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
