# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# SRS is a Linux system information viewer inspired by SIV64X (System Information Viewer) and
# built to improve on it. SIV is the work of Ray Hinchliffe, RH Software (https://rh-software.com);
# SRS is an independent project, not affiliated with SIV or its author.

pkgname=srs-sysinfo
pkgver=1.1.0
pkgrel=1
pkgdesc="Linux system information viewer inspired by SIV64X (independent, not affiliated with SIV): GTK3 GUI, 545 report items, user guide, CPU burner, benchmarks"
arch=('x86_64')
url="https://github.com/eugenesflanagin-spec/srs-sysinfo"
license=('GPL-2.0-or-later')
depends=('bash' 'gtk3' 'glib2' 'glibc' 'pango' 'cairo' 'hicolor-icon-theme' 'hwdata' 'systemd')
optdepends=(
  'libayatana-appindicator: system tray icon (like the SIV Icon Tray)'
  'polkit: srs-root helper for root-only data (one pkexec prompt)'
  'dmidecode: SMBIOS details and serials (via srs-root)'
  'i2c-tools: DIMM SPD decode with decode-dimms (via srs-root)'
  'smartmontools: SMART attributes (via srs-root)'
  'nvme-cli: NVMe SMART log (via srs-root)'
  'pciutils: PCI config space (via srs-root) and srs-sysreport'
  'usbutils: lsusb in srs-sysreport'
  'lm_sensors: sensor labels/compute lines and srs-sysreport'
  'vulkan-tools: Vulkan driver summary'
  'clinfo: OpenCL platforms'
  'mesa-utils: OpenGL/EGL renderer info'
  'iw: Wi-Fi link details'
  'bluez-utils: Bluetooth controllers'
  'wireplumber: PipeWire audio graph'
  'libpulse: pactl audio info'
  'inxi: srs-sysreport section'
  'lshw: srs-sysreport section'
  'hwinfo: srs-sysreport section'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86a8a5fe1e926c6f7cc801538075ed24a8926ed6dee3c9481e096b7498ce6bb2')

build() {
  cd "$pkgname-$pkgver"
  make CC=gcc native
}

package() {
  cd "$pkgname-$pkgver"
  make CC=gcc DESTDIR="$pkgdir" SYSPREFIX=/usr install-system
}
