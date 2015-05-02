# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=coreclr-git
pkgver=7309fb8
pkgrel=1
pkgdesc="The .NET Core Runtime"
arch=('x86_64')
url="https://github.com/dotnet/coreclr"
license=(MIT)
makedepends=('clang' 'cmake' 'llvm' 'lldb' 'libunwind')
provides=('coreclr')
source=('git+https://github.com/dotnet/coreclr') 
sha1sums=('SKIP')
_gitname=coreclr

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  ./build.sh
}

package() {
  install -Dm755 ${srcdir}/${_gitname}/bin/Product/Linux.x64.Debug/corerun ${pkgdir}/usr/bin/corerun
  install -d ${pkgdir}/usr/{lib,include}
  install ${srcdir}/${_gitname}/bin/Product/Linux.x64.Debug/*.so ${pkgdir}/usr/lib/
  install ${srcdir}/${_gitname}/bin/Product/Linux.x64.Debug/inc/*.h ${pkgdir}/usr/include/
}

# vim:set ts=2 sw=2 et:
