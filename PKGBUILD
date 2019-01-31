# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# https://github.com/aur-archive/kradio

pkgname=kradio-git
pkgver=1291.39541ffa
pkgrel=1
pkgdesc='Comfortable KDE internet and AM/FM radio application'
arch=('i686' 'x86_64')
url='http://kradio.sourceforge.net/'
license=('GPL2')
depends=('kdebase-runtime' 'lirc' 'libmms' 'ffmpeg')
makedepends=('automoc4' 'cmake' 'boost')
replaces=('kradio')
install="${pkgname}.install"
source=("kradio-git::git://git.code.sf.net/p/kradio/code")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build
  cd build
  cmake -Wno-dev ".." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
