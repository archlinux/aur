pkgname=archiso-systemd-boot
pkgver=2024.05.01
pkgrel=1
pkgdesc='archiso as systemd-boot loader entry'
arch=('x86_64')
url='https://archlinux.org/download/'
license=('GPL-3.0-or-later')
depends=('systemd')
options=('!debug')
backup=("boot/loader/entries/arch-rescue.conf")
source=("https://geo.mirror.pkgbuild.com/iso/${pkgver}/archlinux-${pkgver}-${arch}.iso"
        "arch-rescue.conf")
noextract=("archlinux-${pkgver}-${arch}.iso")
b2sums=('b7b241e0a56166f430b372109309d73698f2c64f7cd249398feee0fe4e0241ec9a3f77d4b8f33bd2d51fd75caeeececcec14bfb1bbb6da3ad1f043641982130a'
        'c361db0edd5befa0a74a54dc64be95a6946702c3c0d7c6579e7ac3ca6f01af24c9cb37e1e9d339ecf3a2696b8f8e00f9dc984638bc5cb6fba31cf1c4e66af0e9')

prepare() {
  cd ${srcdir}
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/${arch}/initramfs-linux.img
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/${arch}/vmlinuz-linux
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/${arch}/airootfs.sfs
}

package() {
  install -d "${pkgdir}"/boot/archiso/${arch}
  install "${srcdir}"/arch/boot/${arch}/initramfs-linux.img "${pkgdir}"/boot/archiso/initramfs-linux.img
  install "${srcdir}"/arch/boot/${arch}/vmlinuz-linux "${pkgdir}"/boot/archiso/vmlinuz-linux
  install "${srcdir}"/arch/${arch}/airootfs.sfs "${pkgdir}"/boot/archiso/${arch}/airootfs.sfs
  install -d -m 755 "${pkgdir}"/boot/loader/entries
  install arch-rescue.conf "${pkgdir}"/boot/loader/entries/arch-rescue.conf
}
