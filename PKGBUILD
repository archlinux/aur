# Maintainer: Michael Taboada <michael@2mb.solutions>
pkgname=binfmt-qemu-all-arch
pkgver=20190813
pkgrel=2
pkgdesc="Register qemu interpreters for various binary formats - all archetectures, intelligently removing the current archetecture"
arch=('armv5' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('GPL')
optdepends=('qemu' 'qemu-arch-extra')
provides=('binfmt-qemu')
conflicts=('binfmt-qemu')
source=("qemu.conf")
md5sums=('ef046cbee5bcdbc55f712a2bd928b18d')

package() {
  install -Dm 644 "$srcdir/qemu.conf" "$pkgdir/usr/lib/binfmt.d/qemu.conf"
  case $CARCH in
    arm* | aarch64) sed -i "/qemu-arm/d" "$pkgdir/usr/lib/binfmt.d/qemu.conf" ;;
    aarch64) sed -i "/qemu-aarch64/d" "$pkgdir/usr/lib/binfmt.d/qemu.conf" ;;
    i686 | x86_64) sed -i "/qemu-i386/d" "$pkgdir/usr/lib/binfmt.d/qemu.conf" ;  sed -i "/qemu-x86_64/d" "$pkgdir/usr/lib/binfmt.d/qemu.conf" ;;
    *) sed -i "/$CARCH/d" "$pkgdir/usr/lib/binfmt.d/qemu.conf" ;;
  esac
}

# vim:set ts=2 sw=2 et:
