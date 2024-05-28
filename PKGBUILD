# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.1.11
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://www.hardinfo2.org"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=('gtk3' 'libsoup3')
makedepends=('cmake')
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
provides=('hardinfo')
conflicts=('hardinfo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hardinfo2/hardinfo2/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('13ab1292786a739be0017088708ed2becbb1af7ecbc431392f3554101c2b41f2')

build() {
  cmake -B build -S "$pkgname-release-$pkgver" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
