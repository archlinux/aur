# Maintainer: brent s. <bts (AT) square-r00t [dot] net>
pkgname=libyuv-git
_pkgname=libyuv
pkgver=0.000001
pkgrel=3
pkgdesc="A library for YUV scaling (git)"
arch=('i686' 'x86_64')
url="https://github.com/lemenkov/libyuv"
license=('custom')
#depends=('')
makedepends=('depot-tools-git' 'cmake')
#optdepends=('')
provides=('libyuv')
source=('git+https://github.com/lemenkov/libyuv.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  cd "${srcdir}/${_pkgname}/"
  mkdir out
  cd out
  mkdir -p ${pkgdir}/usr/lib
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib" -DCMAKE_BUILD_TYPE="Release" ..
  cmake --build . --config Release
  cmake --build . --target install --config Release

}
