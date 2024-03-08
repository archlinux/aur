# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.0.12
pkgrel=2
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://github.com/hardinfo2/hardinfo2"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libsoup')
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('b7ba812b2e43f2873826f7dc5363fc24baf3a7e51da22a7b160b5fe4c5dd23ab')

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
