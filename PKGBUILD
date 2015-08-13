# Maintainer: csllbr

_pkgname=orgmk
pkgname=orgmk-git
pkgver=r45.42ceb56
pkgrel=2
pkgdesc='Export Org mode documents to HTML, PDF, etc.'
url='https://github.com/fniessen/orgmk'
license=('GPL')
source=('git+https://github.com/fniessen/orgmk.git')
sha256sums=('SKIP')
arch=('any')
depends=('emacs')
makedepends=('git')
conflicts=('')
provides=('orgmk')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i '/ORGMK_ROOT=\$\(PWD\)/c\ORGMK_ROOT=/usr/share/orgmk' Makefile
  make
}

package() {
  mkdir -p "${pkgdir}"/usr/share/orgmk
  mkdir -p "${pkgdir}"/usr/bin
  cd "${srcdir}"


  cp -R ${_pkgname}/* "${pkgdir}"/usr/share/orgmk

  ln -s /usr/share/orgmk/bin/* "${pkgdir}"/usr/bin 
  
}