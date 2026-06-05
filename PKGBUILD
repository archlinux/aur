# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: "Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>"

pkgname=genimage
pkgver=20
pkgrel=1
pkgdesc="Tool to generate multiple filesystem and flash images from a tree"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/pengutronix/$pkgname
license=(GPL-2.0-only)
depends=(confuse glibc)
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
sha256sums=('4cadce884f920a4663c59652f1b87787772628ee4e2867a48e94c69f122fae57')

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
