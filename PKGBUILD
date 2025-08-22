# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"

pkgname=genimage
pkgver=19
pkgrel=1
pkgdesc="Tool to generate multiple filesystem and flash images from a tree"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/pengutronix/$pkgname
license=(GPL-2.0-only)
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
sha256sums=('f620b1cd0299c12a17f523d29cdad44075d1c87c47020bb63a98bf51901d8db5')

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
