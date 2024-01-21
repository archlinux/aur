# Maintainer: zccrs <zhangjide@deepin.org>
pkgname=treeland-git
pkgver=0.1.1.r84.g459ec74
pkgrel=1
sourcename=treeland
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='a new wayland compositer for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/treeland"
license=('LGPL3')
depends=('qt6-declarative')
makedepends=('git' 'qt6-tools' 'waylib' 'cmake'  'ninja')
conflicts=('treeland')
provides=('treeland')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd $sourcedir
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcedir
  cmake -GNinja \
      -DCMAKE_INSTALL_LIBEXECDIR=libexec \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release

  cmake --build .
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
