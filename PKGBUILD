# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap
pkgver=0.2.2.beta2.8.ge710562
pkgrel=2
pkgdesc="Medical image viewer and DICOM client"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'dconf' 'dcmtk')
makedepends=('git' 'intltool' 'perl-xml-parser' 'gconf' 'icu')
options=('!libtool' '!makeflags')
source=("git+https://gitlab.com/stefanhusmann/$pkgname.git#commit=e710562d45303cd3b5f8c3260f9c1ed6b9648bdc") 
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | cut -c9- | tr - .
}

build() {
  cd $pkgname
  ./autogen.sh \
    --prefix=/usr \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}
