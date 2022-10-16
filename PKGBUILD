# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"

pkgname=genimage
pkgver=16
pkgrel=1
pkgdesc="tool to generate multiple filesystem and flash images from a tree"
arch=($CARCH)
url=https://github.com/pengutronix/$pkgname
license=(GPL2)
depends=(confuse)
optdepends=(
	'cramfs-tools: mkcramfs'
	'genext2fs'
    'qemu-headless: qemu-img'
    'qemu: qemu-img'
	'uboot-tools: mkimage'
    'rauc'
  	'android-simg2img: simg2img'
    'simg-tools: simg2img'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('5b5ff31e58afdcf71bd7b61f7d81ee43c4c0751276bc03d51f40475e1c66e51a')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules --disable-dependency-tracking
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check || /bin/true
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -vdm755 "$pkgdir/usr/share/doc/$pkgname"
}
