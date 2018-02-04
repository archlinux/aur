# Maintainer: Andris Pavenis <andris dot pavenis at iki dot fi>

pkgname=dtl-git
_pkgname=dtl
pkgver=r18.9cf6da7
pkgrel=1
pkgdesc="diff template library written in C++ (headers only)"
arch=('any')
url="https://github.com/cubicdaiya/dtl"
license=('BSD')
source=('git+https://github.com/cubicdaiya/dtl.git')
makedepends=('git' 'scons' 'gtest')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${_pkgname}/test"
  scons .
  ./dtl_test
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d ${pkgdir}/usr/include/${_pkgname}
  for file in ${srcdir}/${_pkgname}/dtl/*.hpp; do
    install -m0644 $file ${pkgdir}/usr/include/${_pkgname}/
  done
  install -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/examples
  install -m0644 ${srcdir}/${_pkgname}/examples/SConstruct ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/examples/
  install -m0644 ${srcdir}/${_pkgname}/examples/*.cpp ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/examples/
  install -m0644 ${srcdir}/${_pkgname}/examples/*.hpp ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/examples/
  for file in ChangeLog CONTRIBUTORS README.md; do
    install -m0644 ${srcdir}/${_pkgname}/$file ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/
  done
  install -D -m0644 ${srcdir}/${_pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
