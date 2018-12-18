# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=melonds-git
_gitname=melonds
_releasever=0.7.2
pkgver=0.7.2.r623.dd30b41
pkgdesc='DS emulator, sorta. also 1st quality melon.'
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPLv3')
makedepends=('git' 'cmake')
depends=('gtk3' 'pkg-config')
source=("${_gitname}::git://github.com/StapleButter/${_gitname}.git")
provdes=('melonds')
conflicts=('melonds')

md5sums=('SKIP')

pkgver()
{
  cd "${_gitname}"
  printf "%s.r%s.%s" "${_releasever}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  cd build
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make VERBOSE=ON
}

package()
{
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
