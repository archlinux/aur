# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=libewf-git
pkgver=20161109.11a3f476
pkgrel=1
pkgdesc='Library to access the Expert Witness Compression Format (EWF)'
arch=('any')
url='https://github.com/libyal/libewf'
license=('LGPL')
provides=('libewf-git')
conflicts=('libewf')
groups=()
depends=()
makedepends=('git' 'autoconf' 'automake' 'libtool' 'gettext' 'pkg-config' 'bison' 'flex')
optdepends=()
options=()
source=('git+https://github.com/libyal/libewf.git')
sha1sums=('SKIP')

_gitname="libewf"

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$_gitname"

  ./synclibs.sh
  sed -i '/ewftools/d' Makefile.am
  sed -i '/ewftools/d' configure.ac
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc

  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}