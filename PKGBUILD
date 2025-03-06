# Maintainer: zccrs <zhangjide@deepin.org>
pkgname=treeland-git
pkgver=0.5.19.r7.ge2cdab9
pkgrel=1
sourcename=treeland
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='a new wayland compositer for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/treeland"
license=('LGPL3')
depends=('qt6-declarative' 'dtk6core' 'dtk6declarative')
makedepends=('git' 'qt6-tools' 'waylib' 'cmake'  'ninja' 'dtk6systemsettings' 'ddm' 'jemalloc' 'treeland-protocols')
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
  cmake -B build -GNinja \
      -DCMAKE_INSTALL_LIBEXECDIR=libexec \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  cd $sourcedir/build
  DESTDIR="$pkgdir" ninja install
}
