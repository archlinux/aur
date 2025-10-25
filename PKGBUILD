# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=grml-systemd-boot
pkgver="2025.08"
pkgrel=1
pkgdesc="GRML as systemd-boot loader entry"
url="https://wiki.archlinux.org/title/Systemd-boot#Grml_on_ESP"
arch=(any)
license=(GPL)
depends=(systemd)

source=(
	https://download.grml.org/grml-small-$pkgver-amd64.iso
	grml.conf
)

# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(
    'b595fb3edb20f798ec01fe33aab498f1738ed0df9d2a37c2222db7f4db5152f7'
    '6c45a8da036f41753cb7309ea4d61a6b1423d07e633edb1130f9ab890a207809'
)

package() {
  install -d ${pkgdir}/boot/grml
  cp $srcdir/boot/grmlsmallamd64/vmlinuz $pkgdir/boot/grml
  cp $srcdir/boot/grmlsmallamd64/initrd.img $pkgdir/boot/grml
  cp $srcdir/live/grml-small-amd64/grml-small-amd64.squashfs $pkgdir/boot/grml
  install -d $pkgdir/boot/loader/entries
  cp grml.conf $pkgdir/boot/loader/entries
}
