# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
# Upstream: TIANLI0 <wutianli@tianli0.top>

pkgname=thrm-bin
pkgver=3.9.0
pkgrel=1
pkgdesc='Flydigi BS-series laptop cooler controller (prebuilt)'
arch=('x86_64')
url='https://github.com/TIANLI0/THRM'
license=('MIT')
depends=(
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'libx11'
  'libsoup3'
  'systemd-libs'
  'webkitgtk-6.0'
)
optdepends=('bluez: BS1 BLE support')
provides=("thrm=${pkgver}")
conflicts=('thrm')
options=('!strip' '!debug')

source=(
  "https://github.com/TIANLI0/THRM/releases/download/v${pkgver}/THRM-linux-amd64-portable.tar.gz"
  "thrm.desktop::https://raw.githubusercontent.com/TIANLI0/THRM/v${pkgver}/packaging/linux/thrm.desktop"
  "LICENSE::https://raw.githubusercontent.com/TIANLI0/THRM/v${pkgver}/LICENSE"
)
sha256sums=(
  '62d326848711835b8e31123ec8512ed4933dbba830335dc8367a6c32fd39ebec'
  '4144920f63b10e483bcf5f69094e8ccfc1af01f76836d6785ceca3ee66e4bb28'
  'bb4f94dbe3dcfdc66e27d35cae627a73c9e8f66ec792971e569d272893b08ac6'
)

prepare() {
  mv "$srcdir/THRM-linux-amd64/thrm" "$srcdir/thrm"
  mv "$srcdir/THRM-linux-amd64/thrm-core" "$srcdir/thrm-core"
  mv "$srcdir/THRM-linux-amd64/99-flydigi-fan.rules" "$srcdir/99-flydigi-fan.rules"
  mv "$srcdir/THRM-linux-amd64/appicon.png" "$srcdir/thrm.png"
}


package() {
  install -Dm755 "${srcdir}/thrm" "${pkgdir}/usr/bin/thrm"
  install -Dm755 "${srcdir}/thrm-core" "${pkgdir}/usr/bin/thrm-core"
  install -Dm755 "${srcdir}/thrm-rapl-helper" "${pkgdir}/usr/bin/thrm-rapl-helper"
  install -Dm644 "${srcdir}/99-flydigi-fan.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-flydigi-fan.rules"
  install -Dm644 "${srcdir}/thrm.desktop" \
    "${pkgdir}/usr/share/applications/thrm.desktop"
  install -Dm644 "${srcdir}/thrm.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/thrm.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
