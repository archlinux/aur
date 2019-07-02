# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap
pkgver=0.2.2.beta2.4.g26ad27a
pkgrel=1
pkgdesc="Medical image viewer and DICOM client"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'dconf' 'dcmtk363')
makedepends=('git' 'intltool' 'perl-xml-parser' 'gconf')
options=('!libtool' '!makeflags')
source=("git+https://gitlab.com/stefanhusmann/$pkgname.git#commit=26ad27a07ec116f9b4d35f3907c6f120bf107d61") 
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
