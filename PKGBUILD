# Maintainer: Uffe Jakobsen <_uffe_|_at_|_uffe_|_dot_|_org_>
pkgname=stlink-tool-git
_pkgname=stlink-tool
pkgver=r21.8cbdffe
pkgrel=1
pkgdesc="Tool for flashing chinese ST-Link dongles"
arch=('i686' 'x86_64')
url="https://github.com/UweBonnes/stlink-tool"
license=('GPL')
source=('git+https://github.com/UweBonnes/stlink-tool.git')
depends=('libusb')
makedepends=('git')
provides=('stlink-tool')
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
}

build()
{
  cd "${srcdir}/${_pkgname}"
  make
}

package()
{
  cd "${srcdir}/${_pkgname}/"

  install -D -m755 stlink-tool ${pkgdir}/usr/bin/stlink-tool
}

#
# EOF
#
