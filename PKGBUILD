# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.23.5
pkgrel=3
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
sha512sums_x86_64=('e48ae2427a6c4be7522d4b72fc3c9301f799a6a1f997212ae44eede3f998b96af9e2029622e774c377a65da3c3fce5efc8cd84761be82c19dc5a295a7b815eff')
sha512sums_aarch64=('bc4c4a93bf6a2d935a2cfbddf3d1f4f5c9171e35a013a93e2e5a2d134c7b740e423a5ea0c740724ff6bb85f162a0a0f76da3566947b65aca76776d3764cddbe8')
sha512sums_armel=('93bb595299d04c84ecd4d61caf7b281b5ab14525675b489778792ba2819318de7dffdbf03c2e848cc449886aa499b02a8b699932301bfc99c92e7127fe57fcad')
sha512sums_armv7h=('3975bf1b077014cd3ec105b30edbc5b6d92d40b92e2c97fc328aed407538a7879cfa366fc9e447bb163882d6e09933375df21ed0bb44a9b6e60159aa8438fc6c')

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
