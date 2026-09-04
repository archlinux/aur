# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Contributor: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-full-systemd-boot
pkgver=2026.09
pkgrel=1
pkgdesc="GRML-full as systemd-boot loader entry"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
arch=('x86_64')
license=(GPL-2.0-or-later)
depends=(systemd)
options=('!debug')
backup=("boot/loader/entries/grml-full.conf")
source=(
  https://download.grml.org/grml-full-"${pkgver}"-amd64.iso
  grml-full.conf
)
noextract=(grml-full-"${pkgver}"-amd64.iso)

sha256sums=('76e8019ff1b68ddb3e49cecb1ea35ecead9e0f1c1ba22c0e819c9b13de939e72'
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
