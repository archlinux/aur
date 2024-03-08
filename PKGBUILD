# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2-git
pkgver=2.0.12.r15.g0a095c0
pkgrel=2
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://github.com/hardinfo2/hardinfo2"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libsoup3')
makedepends=('cmake' 'git')
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/hardinfo2/hardinfo2.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DHARDINFO2_LIBSOUP3='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
