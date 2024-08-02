pkgname=archiso-systemd-boot
pkgver=2024.08.01
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
b2sums=('d03ed2e9aeb58bafcb09f06e95433f29290b40be1cd7c317f4b000cbf927d7beda3d99636e2e794385e46d94e905d6514722f36937bc071a62f8bdfdccee98c0'
        'c361db0edd5befa0a74a54dc64be95a6946702c3c0d7c6579e7ac3ca6f01af24c9cb37e1e9d339ecf3a2696b8f8e00f9dc984638bc5cb6fba31cf1c4e66af0e9')

prepare() {
  cd ${srcdir}
  bsdtar xf archlinux-${pkgver}-${arch}.iso \
    arch/boot/${arch}/initramfs-linux.img \
    arch/boot/${arch}/vmlinuz-linux \
    arch/${arch}/airootfs.sfs
}

package() {
  install -d "${pkgdir}"/boot/archiso/${arch}
  install "${srcdir}"/arch/boot/${arch}/initramfs-linux.img "${pkgdir}"/boot/archiso/initramfs-linux.img
  install "${srcdir}"/arch/boot/${arch}/vmlinuz-linux "${pkgdir}"/boot/archiso/vmlinuz-linux
  install "${srcdir}"/arch/${arch}/airootfs.sfs "${pkgdir}"/boot/archiso/${arch}/airootfs.sfs
  install -d -m 755 "${pkgdir}"/boot/loader/entries
  install arch-rescue.conf "${pkgdir}"/boot/loader/entries/arch-rescue.conf
}
