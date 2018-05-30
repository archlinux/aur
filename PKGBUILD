# Maintainer: Tomáš Mládek < tmladek {} inventati dt org >
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=aeskulap
pkgver=0.2.2.beta2.1.gce82f85
pkgrel=1
pkgdesc="Medical image viewer and DICOM client. Compatible with parallel installation of the package 'dcmtk'."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/aeskulap"
license=('GPL')
depends=('libglademm' 'dconf' 'dcmtk')
makedepends=('git' 'intltool' 'perl-xml-parser' 'gconf')
options=('!libtool' '!makeflags')
source=("git+https://github.com/jenslody/$pkgname.git#commit=ce82f856868f7a3217fff714d0de5ee8b6cf3aa2")
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
