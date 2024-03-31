# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.0.18
pkgrel=2
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=('gtk3' 'libsoup3')
optdepends=(
  'dmidecode: Memory Devices / System DMI module'
  'fwupd: Firmware module'
  'iperf3: Internal Network Speed benchmark'
  'lm_sensors: Sensors module'
  'lsscsi: SCSI support for Storage module'
  'mesa-utils: GLX info for Display module'
  'pciutils: PCI Devices module'
  'sysbench: SysBench CPU benchmark'
  'udisks2: Storage module'
  'usbutils: USB Devices module'
  'xdg-utils: open your browser for bugs, homepage & links')
makedepends=('cmake')
provides=('hardinfo')
conflicts=('hardinfo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hardinfo2/hardinfo2/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('d8342d5e66d3779e8ac1fb9b3366bbbca9ade2816de556c89082ff04127bfa58')

build() {
  cmake -B build -S "$pkgname-release-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
