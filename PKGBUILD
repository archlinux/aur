# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: FadeMind <fademind@gmail.com>

pkgname=inxi-git
pkgver=3.0.29.r0.gb1194550
pkgrel=1
pkgdesc="script to get system information (git version)"
arch=(any)
url="https://github.com/smxi/inxi"
license=(GPL3)
depends=(coreutils pciutils perl procps-ng)
makedepends=(git)
optdepends=(
  "bind-tools: -i wlan IP"
  "dmidecode: inxi -M if no sys machine data"
  "file: inxi -o unmounted file system"
  "hddtemp: inxi -Dx show hdd temp"
  "iproute2: inxi -i ip lan"
  "kmod: inxi -Ax,-Nx module version"
  "lm_sensors: inxi -s sensors output"
  "mesa-demos: inxi -G glx info"
  "net-tools: inxi -i ip lan-deprecated"
  "perl-io-socket-ssl: -U; -w,-W; -i (if dig not installed)"
  "perl-cpanel-json-xs: --output json - required for export"
  "perl-json-xs: --output json - required for export (legacy)"
  "perl-xml-dumper: --output xml - Crude and raw"
  "systemd-sysvcompat: inxi -I runlevel"
  "sudo: inxi -Dx hddtemp-user;-o file-user"
  "tree: --debugger 20,21 /sys tree"
  "usbutils: inxi -A usb audio;-N usb networking"
  "wmctrl: -S active window manager (not all wm)"
  "xorg-xdpyinfo: inxi -G multi screen resolution"
  "xorg-xprop: inxi -S desktop data"
  "xorg-xrandr: inxi -G single screen resolution"
)
provides=(inxi)
conflicts=(inxi)
options=(zipman)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/1-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  install -Dm755 "${pkgname/-git/}"   "${pkgdir}/usr/bin/${pkgname/-git/}"
  install -Dm644 "${pkgname/-git/}.1" "${pkgdir}/usr/share/man/man1/${pkgname/-git/}.1"
}
