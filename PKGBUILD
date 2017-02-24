# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Archlive <http://archlive-pkg.googlecode.com>

pkgname=fatelf-utils
_pkgname=fatelf
pkgver=111.5e7e594b70fa
pkgrel=2
pkgdesc='Utils for FatELF - Universal Binaries for Linux'
arch=('i686' 'x86_64')
url='https://www.icculus.org/fatelf/'
license=('GPL2')
makedepends=('cmake')
source=('hg+https://hg.icculus.org/icculus/fatelf')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}/${_pkgname}"
  CFLAGS+=" -O0"
  cmake .
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  sed -i "s|/usr/local|/usr|g" cmake_install.cmake
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -m644 docs/*.txt "${pkgdir}/usr/share/doc/${_pkgname}/"
}
