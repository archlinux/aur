# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-systemd-boot
pkgver="2021.07"
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
  "f94529b6cbfb79ae54a4b6d5dfe8caf1a836facd85959996dd6712c20bb9c5c2"
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
