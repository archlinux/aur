# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Build Options
_boot_dir=${boot_dir:-/boot}
_efi_dir=${efi_dir:-/boot/EFI}

pkgbase=netbootxyz-systemd-boot
pkgname=('netbootxyz-systemd-boot' 'netbootxyz-legacy-systemd-boot')
pkgver=3.0.3
pkgrel=1
arch=('x86_64')
url='https://netboot.xyz/'
license=('Apache-2.0')
depends=('systemd')
options=('!debug')
backup=("boot/loader/entries/netbootxyz.conf")
source=("https://github.com/netbootxyz/netboot.xyz/releases/download/${pkgver}/netboot.xyz.efi"
        "https://github.com/netbootxyz/netboot.xyz/releases/download/${pkgver}/netboot.xyz-legacy.efi"
        "netbootxyz.conf")
b2sums=('4b3d8c595bb62cda070871053766ebacacd18182f355aecad647da794a4eeb97707ad2579a2b7908bf61df6afd5b2c1702f881736ed3a7576899e32f228beb6c'
        '5c7685d8aa2a10c3a7178a8d474b0c73dcc6befbc9d1c1207bc38b7d7a282b95764bbe5d38eeaf86a5412abfa8ec3e833fbb7940419aae628359a3d51216cd40'
        '0d75be01199f04deae3a6bd0d40198b888ed6b60820fd81de26ed84730c033323a5694edf6e86e87e678f573204b209a6a3da690af303256661dedccbf50180b')

package_netbootxyz-systemd-boot() {
  pkgdesc='netboot.xyz as systemd-boot loader entry'
  conflicts=('netbootxyz-legacy-systemd-boot')
  install -d "${pkgdir}"/"${_efi_dir}"/netbootxyz
  install "${srcdir}"/netboot.xyz.efi "${pkgdir}"/"${_efi_dir}"/netbootxyz/netbootxyz.efi
  install -d -m 755 "${pkgdir}"/"${_boot_dir}"/loader/entries
  install netbootxyz.conf "${pkgdir}"/"${_boot_dir}"/loader/entries/netbootxyz.conf
}

package_netbootxyz-legacy-systemd-boot() {
  pkgdesc='netboot.xyz as systemd-boot loader entry (legacy version without the USB NIC drivers)'
  conflicts=('netbootxyz-systemd-boot')
  install -d "${pkgdir}"/"${_efi_dir}"/netbootxyz
  install "${srcdir}"/netboot.xyz-legacy.efi "${pkgdir}"/"${_efi_dir}"/netbootxyz/netbootxyz.efi
  install -d -m 755 "${pkgdir}"/"${_boot_dir}"/loader/entries
  install netbootxyz.conf "${pkgdir}"/"${_boot_dir}"/loader/entries/netbootxyz.conf
}
