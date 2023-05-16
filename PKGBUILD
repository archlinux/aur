pkgname=archiso-systemd-boot
pkgver=2023.05.03
pkgrel=1
pkgdesc='archiso as systemd-boot loader entry'
arch=('x86_64')
url='https://archlinux.org/download/'
license=('GPL')
depends=('systemd')
install="${pkgname}.install"
source=("https://geo.mirror.pkgbuild.com/iso/${pkgver}/archlinux-${pkgver}-${arch}.iso"
        "${pkgname}.install"
        "arch-rescue.conf")
noextract=("archlinux-${pkgver}-${arch}.iso")
b2sums=('6d8f1ae992900cb10cdd3e1abd6137d59ce08e3cc532f9fd67dd629058b4404488a854ce5baa56c7c516c386f0296d7768e964f660bdd53c66d5f1ecf3268938'
        'b407870bef382a49019b06ea4598cc4e53d4ff40da045f2a012fa2f858aa34001f7ecef067f48a008a471649e6dd1dfe2e42f1dc2696a44d1175812324e09bec'
        'ad6aa24e2bb0850d60c7f3888fa31bd834e74c87388a89b4141ff3b80d1edb7bc4d57483d8cd122a16515018fdcc8505462b00ea1ae82048653dfc7ada8dbe63')

prepare() {
  cd ${srcdir}
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/amd-ucode.img
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/intel-ucode.img
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/${arch}/initramfs-linux.img
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/boot/${arch}/vmlinuz-linux
  bsdtar xf archlinux-${pkgver}-${arch}.iso arch/${arch}/airootfs.sfs
}

package() {
  install -d "${pkgdir}"/boot/archiso/${arch}
  install "${srcdir}"/arch/boot/amd-ucode.img "${pkgdir}"/boot/archiso/amd-ucode.img
  install "${srcdir}"/arch/boot/intel-ucode.img "${pkgdir}"/boot/archiso/intel-ucode.img
  install "${srcdir}"/arch/boot/${arch}/initramfs-linux.img "${pkgdir}"/boot/archiso/initramfs-linux.img
  install "${srcdir}"/arch/boot/${arch}/vmlinuz-linux "${pkgdir}"/boot/archiso/vmlinuz-linux
  install "${srcdir}"/arch/${arch}/airootfs.sfs "${pkgdir}"/boot/archiso/${arch}/airootfs.sfs
  install -d -m 755 "${pkgdir}"/usr/share/doc/${pkgname}
  install arch-rescue.conf "${pkgdir}"/usr/share/doc/${pkgname}/arch-rescue.conf
}
