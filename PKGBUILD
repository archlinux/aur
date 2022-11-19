# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=emmcdl-git
pkgver=0.r88.d7b7804
pkgrel=1
pkgdesc="Console utility for working with device partitions based on the Qualcomm processor for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/Zalexanninev15/emmcdl"
license=('GPL3')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  aclocal
  autoconf
  automake --add-missing
  ./configure
  make 
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 emmcdl $pkgdir/usr/bin/emmcdl
}

