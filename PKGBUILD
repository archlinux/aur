# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-full-systemd-boot
pkgver="2025.08"
pkgrel=1
pkgdesc="GRML-full as systemd-boot loader entry"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
arch=('x86_64')
license=(GPL)
depends=(systemd)
options=('!debug')
backup=("boot/loader/entries/grml-full.conf")
source=(
	https://download.grml.org/grml-full-"${pkgver}"-amd64.iso
	grml-full.conf
)
noextract=(grml-full-"${pkgver}"-amd64.iso)

sha256sums=('3095df671a477304f2bf68c14494a4fb7becc7260497fa2e937e75de08bdba4c'
            'c5fbdf83f1dcf220ad764175ab0eda013edd7d86ffccda747ea41ce1a8ba7b1f')

prepare() {
  cd "${srcdir}"
  bsdtar xf grml-full-"${pkgver}"-amd64.iso \
	boot/grmlfullamd64/vmlinuz \
 	boot/grmlfullamd64/initrd.img \
   	live/grml-full-amd64/grml-full-amd64.squashfs
}

package() {
  install -d ${pkgdir}/boot/grml
  cp "${srcdir}"/boot/grmlfullamd64/vmlinuz "${pkgdir}"/boot/grml/vmlinuz-grml-full
  cp "${srcdir}"/boot/grmlfullamd64/initrd.img "${pkgdir}"/boot/grml/initrd-grml-full.img
  cp "${srcdir}"/live/grml-full-amd64/grml-full-amd64.squashfs "${pkgdir}"/boot/grml
  install -d -m 755 "${pkgdir}"/boot/loader/entries
  cp grml-full.conf "${pkgdir}"/boot/loader/entries/grml-full.conf
}
