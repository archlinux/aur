# Maintainer: Eugene Flanagin <eflanagin@pm.me>
#
# SRS is a Linux system information viewer inspired by SIV64X (System Information Viewer) and
# built to improve on it. SIV is the work of Ray Hinchliffe, RH Software (https://rh-software.com);
# SRS is an independent project, not affiliated with SIV or its author.

pkgname=srs-sysinfo
pkgver=2.3.1
pkgrel=1
pkgdesc="Linux system information viewer inspired by SIV64X (independent, not affiliated with SIV): GTK3 GUI, 558 report items, user guide, CPU and GPU burn-in, benchmarks"
arch=('x86_64')
url="https://github.com/eugenesflanagin-spec/srs-sysinfo"
license=('GPL-2.0-or-later')
depends=('bash' 'gtk3' 'glib2' 'glibc' 'pango' 'cairo' 'sqlite' 'hicolor-icon-theme' 'hwdata' 'systemd')
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
  'zlib: zlib rows of the Everyday Work benchmark (loaded at run time)'
  'zstd: zstd rows of the Everyday Work benchmark (loaded at run time)'
  'lz4: lz4 rows of the Everyday Work benchmark (loaded at run time)'
  'xz: xz rows of the Everyday Work benchmark (loaded at run time)'
  'curl: libcurl for the optional internet speed test of the Network benchmark (loaded at run time)'
  "vulkan-icd-loader: the GPU benchmarks (Vulkan loader, loaded at run time; plus your GPU's Vulkan driver)"
  'rocm-hip-runtime: ROCm / HIP back end of GPU Burnin and the GPU Compute comparison (loaded at run time; hipblas for the library rows)'
  'opencl-icd-loader: OpenCL back end of GPU Burnin and the GPU Compute comparison (loaded at run time; plus an OpenCL driver)'
  'clblast: OpenCL matrix library rows of the GPU benchmarks (loaded at run time)'
  'nvidia-utils: CUDA back end of GPU Burnin and the GPU Compute comparison (NVIDIA driver library libcuda, loaded at run time; ZLUDA works instead on AMD)'
  'cuda: NVIDIA runtime compiler (libnvrtc) for SRS CUDA kernels, only a fallback since 2.3 (not needed with ZLUDA; may remove ZLUDA); can be installed later from Options'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('615ad101b0708227886f0b67412b7354da6f95ae020f4b6345e84af1d8e7bbde')

build() {
  cd "$pkgname-$pkgver"
  make CC=gcc native
}

check() {
  cd "$pkgname-$pkgver"
  make CC=gcc test-power
}

package() {
  cd "$pkgname-$pkgver"
  make CC=gcc DESTDIR="$pkgdir" SYSPREFIX=/usr install-system
}
