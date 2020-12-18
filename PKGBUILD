# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: FadeMind <fademind@gmail.com>

pkgname=inxi-perl-git
pkgver=r3749.05e55f8b
pkgrel=1
pkgdesc="Pinxi, development branch of inxi, a full featured CLI system information tool"
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
source=("git+https://github.com/smxi/inxi.git#branch=inxi-perl")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-perl-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname/-perl-git/}"
  install -D -m755 pinxi "$pkgdir/usr/bin/pinxi"
  install -D -m755 pinxi.1 "$pkgdir/usr/share/man/man1/pinxi.1.gz"
}

