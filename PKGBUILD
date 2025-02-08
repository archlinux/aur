# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-full-systemd-boot
pkgver="2024.12"
pkgrel=1
pkgdesc="GRML-full as systemd-boot loader entry"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
arch=(any)
license=(GPL)
depends=(systemd)

source=(
	https://download.grml.org/grml-full-$pkgver-amd64.iso
	grml-full.conf
)
noextract=(grml-full-$pkgver-amd64.iso)

sha256sums=('fb3bd00b032c128a2db50e5d086b2c0859a4597330d8b683d38d6f979bc68213'
            'c5fbdf83f1dcf220ad764175ab0eda013edd7d86ffccda747ea41ce1a8ba7b1f')

prepare() {
  cd $srcdir
  bsdtar xf grml-full-$pkgver-amd64.iso boot/grmlfullamd64/vmlinuz
  bsdtar xf grml-full-$pkgver-amd64.iso boot/grmlfullamd64/initrd.img
  bsdtar xf grml-full-$pkgver-amd64.iso live/grml-full-amd64/grml-full-amd64.squashfs
}

package() {
  install -d ${pkgdir}/boot/grml
  cp $srcdir/boot/grmlfullamd64/vmlinuz $pkgdir/boot/grml/vmlinuz-grml-full
  cp $srcdir/boot/grmlfullamd64/initrd.img $pkgdir/boot/grml/initrd-grml-full.img
  cp $srcdir/live/grml-full-amd64/grml-full-amd64.squashfs $pkgdir/boot/grml
  install -d $pkgdir/boot/loader/entries
  cp grml-full.conf $pkgdir/boot/loader/entries
}
