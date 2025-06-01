pkgname=archiso-systemd-boot
pkgver=2025.06.01
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
b2sums=('0acffbd8cf598485419f8d9e38f857e3bdeb0198644c19468ce707b9a51d1463c0f5c333d95eaf95d448f09275dea2a7865ddf0fa0acb34b6158d17fa09f03d1'
        'f55abf33fbcb7d462d175c16dbe43e4f3bcb7c3ec60ad19a2d31a733c6f8948792b539c48f85dfc7ebe24e136ff74212a129c61605471ce0009c3b62f081a221')

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
