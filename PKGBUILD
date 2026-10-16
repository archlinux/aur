# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# SRS is a clean-room implementation of SIV64X (System Information Viewer) for Linux.
# SIV is the work of Ray Hinchliffe, RH Software (https://rh-software.com); SRS contains no
# SIV code, binaries or data files and is not affiliated with or endorsed by RH Software.

pkgname=srs-sysinfo
pkgver=1.0.6
pkgrel=1
pkgdesc="Clean-room Linux implementation of SIV64X (System Information Viewer by Ray Hinchliffe, RH Software): GTK3 GUI, 538 report items, CPU burner, benchmarks"
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
sha256sums=('7e544a9ca2000a81107fcaa32bfe6c5b99179032a288790f69a4767850fe472a')

build() {
  cd "$pkgname-$pkgver"
  make CC=gcc native
}

package() {
  cd "$pkgname-$pkgver"
  make CC=gcc DESTDIR="$pkgdir" SYSPREFIX=/usr install-system
}
