# Maintainer: PyroDevil <p dot devil at gmail dot com>
pkgname=systemrescuecd
pkgver=4.8.1
pkgrel=1
epoch=
pkgdesc="Installs a rescue system into the boot partition to allow grub to boot it."
arch=('i686' 'x86_64')
url="http://www.sysresccd.org"
license=('GPL')
groups=()
depends=('grub>=2.00')
makedepends=('p7zip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='systemrescuecd.install'
changelog=
source=("http://downloads.sourceforge.net/project/systemrescuecd/sysresccd-x86/$pkgver/$pkgname-x86-$pkgver.iso"
        "25_systemrescuecd"
        "systemrescuecd")
md5sums=('5f79957c793459a699d1076b9f47f9af'
         '5a34f3346f2706032fd6bae7aea3f4d7'
         'df5f42b184ffb2c6cab79fd3889b8cd0')
noextract=("$pkgname-x86-$pkgver.iso")
backup=("etc/default/systemrescuecd")

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  7z x "$srcdir/$pkgname-x86-$pkgver.iso" -o"$srcdir/$pkgname-$pkgver" > /dev/null
}

package() {
  mkdir -p "$pkgdir/boot/sysrescue"
  mkdir -p "$pkgdir/etc/grub.d"
  mkdir -p "$pkgdir/etc/default/"
  install -m 755 "$srcdir/25_systemrescuecd"                     "$pkgdir/etc/grub.d/"
  install -m 644 "$srcdir/systemrescuecd"                        "$pkgdir/etc/default/"
  install -m 644 "$srcdir/$pkgname-$pkgver/isolinux/rescue32"    "$pkgdir/boot/sysrescue/"
  install -m 644 "$srcdir/$pkgname-$pkgver/isolinux/rescue64"    "$pkgdir/boot/sysrescue/"
  install -m 644 "$srcdir/$pkgname-$pkgver/isolinux/altker32"    "$pkgdir/boot/sysrescue/"
  install -m 644 "$srcdir/$pkgname-$pkgver/isolinux/altker64"    "$pkgdir/boot/sysrescue/"
  install -m 644 "$srcdir/$pkgname-$pkgver/isolinux/initram.igz" "$pkgdir/boot/sysrescue/"
  install -m 644 "$srcdir/$pkgname-$pkgver/sysrcd.dat"           "$pkgdir/boot/sysrescue/"
}

# vim:set ts=2 sw=2 et:
