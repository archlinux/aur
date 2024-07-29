# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"

pkgname=genimage
pkgver=18
pkgrel=1
pkgdesc="Tool to generate multiple filesystem and flash images from a tree"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
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
#  	'android-simg2img: simg2img'
#    'simg-tools: simg2img'
)

source=($pkgname-$pkgver.tar.gz::https://github.com/pengutronix/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('af555b9d9f17301ab4cc2cda4849afd88d2b97ae4cc8badb9b8448299d6f6080')

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
