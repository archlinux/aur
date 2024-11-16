pkgname=archiso-systemd-boot
pkgver=2024.11.01
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
b2sums=('b5e5bdd6d1ae5889c300ad22a812d4d8ba7696b5112578bb6eb257772562a4ac945dee54eeb27740630c9c72cd817397951bfe2a050f3131da160889cfe54ebe'
        '7f1ea3990022ab122b3a70d4ed60f441a3bcc9135202d311dd94a60a43e79e82f5654ff61f72c5cfcaa69632ae3ecfcac37c1ac7142fbbad5f618fcbd3dc5612')

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
