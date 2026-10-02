pkgname=archiso-systemd-boot
pkgver=2026.10.01
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
b2sums=('dcccf63640e6d4194d1a741788deff6c0ccd25d5f44f84feb4bfd505088fc90d6964fd06317943c2234365dd1edfd3bd17b7981a0fa776412ccf3d5764760545'
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
