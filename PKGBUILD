# Maintainer: Gianluca Montecchi <gian@grys.it>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=libqglviewer
_pkgname=libQGLViewer
pkgver=2.9.1
pkgrel=1
pkgdesc="C++ library based on Qt that eases the creation of OpenGL 3D viewers"
url="https://github.com/GillesDebunne/libQGLViewer"
arch=('i686' 'x86_64' 'aarch64')
depends=('qt6-base' 'glu' 'libglvnd')
makedepends=('cmake')
conflicts=('libqglviewer-qt4')
license=('GPL2' 'GPL3' 'custom')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea4f9ac627c136a6851ffd3763b154f21c87a58bcec4e5d5b2d07e65a403096b')

build()
{

  cmake -B build -S ${_pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package()
{
  cd "$srcdir"/build
  make install DESTDIR="${pkgdir}"

  cd "$srcdir"/${_pkgname}-${pkgver}
  # Install license.
  install -d -m 0755 "${pkgdir}"/usr/share/licenses/$pkgname/
  install -m 0644 LICENCE GPL_EXCEPTION "${pkgdir}"/usr/share/licenses/$pkgname/
}
