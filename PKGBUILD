#
# PKGBUILD for minipro (stable)
#
# Maintainer: uffe _.at._ uffe _.dat._ org
#

pkgname=minipro
pkgver=0.6

pkg_name_ver="${pkgname}-${pkgver}"

pkgrel=1
pkgdesc="Open source programming utility for autoelectric.cn Minipro TL866"
url="https://gitlab.com/DavidGriffith/minipro"
arch=("i686" "x86_64")
license=("GPL")
depends=("libusb" "srecord")
makedepends=("git")
source=(${pkgname}.tgz::https://gitlab.com/DavidGriffith/minipro/-/archive/${pkgver}/${pkg_name_ver}.tar.gz)
conflicts=("minipro")
provides=("minipro")
sha256sums=('16b4220b5fc07dddc4d1d49cc181a2c6a735c833cc27f24ab73eac2572c9304a')


prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
  cd "${srcdir}/${pkg_name_ver}"

  # MAKEFLAGS="-j1": temporary hack to prevent parallel compile - see link:  https://gitlab.com/DavidGriffith/minipro/-/commit/b2fd68da00154608bcaacde01845466e51795a7d
  #make PREFIX="/usr" MAKEFLAGS="-j1"
  make PREFIX="/usr"
}

package()
{
  cd "${srcdir}/${pkg_name_ver}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" COMPLETIONS_DIR="/usr/share/bash-completion/completions" install
}

# vim: ts=2 sw=2 et:
#
# EOF
#
