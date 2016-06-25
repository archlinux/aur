# Maintainer: brent s. <bts (AT) square-r00t [dot] net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=libyuv-git
_pkgname=libyuv
pkgver=r1445.0735245
pkgrel=4
pkgdesc="A library for YUV scaling (git)"
arch=('i686' 'x86_64')
url="https://github.com/lemenkov/libyuv"
license=('custom')
#depends=('')
makedepends=('depot-tools-git' 'cmake')
#optdepends=('')
provides=('libyuv')
source=('git+https://github.com/lemenkov/libyuv.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  cd "${srcdir}/${_pkgname}/"
  mkdir out
  cd out
  mkdir -p ${pkgdir}/usr/lib
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE="Release" ..
  cmake --build . --config Release
  cmake --build . --target install --config Release

}
