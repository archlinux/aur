# Maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap
pkgver=0.2.2.beta2
pkgrel=2
pkgdesc="Medical image viewer and DICOM client. Compatible with parallel installation of the package 'dcmtk'."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'dconf' 'dcmtk')
makedepends=('intltool' 'perl-xml-parser')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jenslody/aeskulap/archive/release-0-2-2-beta2.tar.gz")
md5sums=('fe440e2a266a1434cb74f3c90838a596')

build() {
  cd $pkgname-release-${pkgver//./-}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname-release-${pkgver//./-}
  make DESTDIR="${pkgdir}" install
}
