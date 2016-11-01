# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=stl2ngc-git
pkgver=18.273f1cc
pkgrel=1
pkgdesc="converts an STL file to LinuxCNC compatible G-Code."
arch=('x86_64')
url="https://github.com/koppi/stl2ngc"
license=('unknown')
depends=('opencamlib-git')
source=('stl2ngc-git::git://github.com/koppi/stl2ngc.git' Makefile.patch)
md5sums=('SKIP'
         '39a6145d878c3b93f7162945d186a72a')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i ../Makefile.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -D -t ${pkgdir}/usr/bin stl2ngc
}
