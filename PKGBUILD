# Maintainer: Alexander Blinne <alexander[at]blinne[dot]net>
pkgname=fatresize
pkgver=1.0.2
pkgrel=1
pkgdesc="Fatresize is a utility to resize FAT filesystems using libparted."
url="http://sourceforge.net/projects/fatresize/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('parted' 'glibc')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "http://archive.ubuntu.com/ubuntu/pool/universe/f/${pkgname}/${pkgname}_${pkgver}-7build1.debian.tar.gz")
md5sums=('3bfac57c0801d33ad39e740841e6441e'
         '14c22608b5c737c989ff0a17c2781037')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../debian/patches/pkg-config.patch
  patch -p1 < ../debian/patches/ped_free.patch
  patch -p1 < ../debian/patches/libparted-3.1.patch
  autoreconf -fiv
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

