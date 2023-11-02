# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-systemd-boot
pkgver="2022.11"
pkgrel=1
pkgdesc="GRML as systemd-boot loader entry"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
arch=(any)
license=(GPL)
depends=(systemd)

source=(
	https://download.grml.org/grml64-small_$pkgver.iso
	grml.conf
)
noextract=(grml64-small_$pkgver.iso)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(
  "7f2a1dbab779fd3900f0d89eb4fdc041ac06142675693dc28b8d2fd9fe26a2ff"
  "SKIP"
)

prepare() {
  cd $srcdir
  bsdtar xf grml64-small_$pkgver.iso boot/grml64small/vmlinuz
  bsdtar xf grml64-small_$pkgver.iso boot/grml64small/initrd.img
  bsdtar xf grml64-small_$pkgver.iso live/grml64-small/grml64-small.squashfs
}

package() {
  install -d ${pkgdir}/boot/grml
  cp $srcdir/boot/grml64small/vmlinuz $pkgdir/boot/grml
  cp $srcdir/boot/grml64small/initrd.img $pkgdir/boot/grml
  cp $srcdir/live/grml64-small/grml64-small.squashfs $pkgdir/boot/grml
  install -d $pkgdir/boot/loader/entries
  cp grml.conf $pkgdir/boot/loader/entries
}
