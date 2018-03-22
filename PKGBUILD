# Maintainer: FadeMind <fademind@gmail.com>

pkgname=inxi-git
pkgver=20180321.fcf8cbbe
pkgrel=1
pkgdesc="script to get system information (git version)"
arch=('any')
url="https://github.com/smxi/inxi"
license=('GPL')
depends=('coreutils' 'gawk' 'grep' 'pciutils' 'perl' 'procps-ng' 'sed')
makedepends=('git')
conflicts=("${pkgname/-git/}")
replaces=("${pkgname/-git/}")
optdepends=(
  "dmidecode: inxi -M if no sys machine data"
  "file: inxi -o unmounted file system"
  "hddtemp: inxi -Dx show hdd temp"
  "net-tools: inxi -i ip lan-deprecated"
  "iproute2: inxi -i ip lan"
  "lm_sensors: inxi -s sensors output"
  "usbutils: inxi -A usb audio;-N usb networking"
  "kmod: inxi -Ax,-Nx module version"
  "systemd-sysvcompat: inxi -I runlevel"
  "sudo: inxi -Dx hddtemp-user;-o file-user"
  "mesa-demos: inxi -G glx info"
  "xorg-xdpyinfo: inxi -G multi screen resolution"
  "xorg-xprop: inxi -S desktop data"
  "xorg-xrandr: inxi -G single screen resolution"
)
options=('zipman')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname/-git/}
    (
    git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
    echo .
    git rev-parse --short master
    ) | tr -d '\n'
}

package() {
    cd ${pkgname/-git/}
    install -Dm755 "${pkgname/-git/}"   "${pkgdir}/usr/bin/${pkgname/-git/}"
    install -Dm644 "${pkgname/-git/}.1" "${pkgdir}/usr/share/man/man1/${pkgname/-git/}.1"
}
