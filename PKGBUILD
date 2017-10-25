# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=melonds-git
_gitname=melonds
_releasever=0.6
pkgver=${_releasever}.3881b26
pkgdesc='DS emulator, sorta. also 1st quality melon.'
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPLv3')
makedepends=('git')
depends=('gtk3' 'pkg-config')
source=("${_gitname}::git://github.com/StapleButter/${_gitname}.git")
provdes=('melonds')
conflicts=('melonds')

md5sums=('SKIP')

pkgver()
{
  cd "${_gitname}"
  echo "${_releasever}.$(git rev-parse --short HEAD)"
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
  make
}

package()
{
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
