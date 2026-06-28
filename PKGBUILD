# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Build Options
_boot_dir=${boot_dir:-/boot}
_efi_dir=${efi_dir:-/boot/EFI}

pkgbase=netbootxyz-systemd-boot
pkgname=('netbootxyz-systemd-boot' 'netbootxyz-legacy-systemd-boot')
pkgver=3.0.2
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
b2sums=('5fce51062f26d3f46878dafc27e367a86c2c51fa797cc420238363be26eb118666f13c3c9773854d7f7b7dddb364f1ef4655aeb8d7c6b617a30d99e96b54a07f'
        '8ff15fb146cff9844b6a3277c20d0bd25266c69b058c96553b34ba8c07cf1111641896a81f042a6bc2a530e3af731dc341bfb7a8524c2220c342c24719c16a9d'
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
