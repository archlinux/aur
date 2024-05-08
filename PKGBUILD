# Maintainer: zccrs <zhangjide@deepin.org>
pkgname=ddm-git
pkgver=r3.8a705fe
pkgrel=1
sourcename=ddm
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='a new Display Manager for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/ddm"
license=('LGPL3')
depends=(bash
         gcc-libs
         glibc
         libxau
         libxcb
         pam
         qt6-base
         systemd-libs
         ttf-font
         xorg-server
         xorg-xauth)
makedepends=(git
             extra-cmake-modules
             python-docutils
             qt6-tools
             ninja)
conflicts=('ddm')
provides=('ddm')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd $sourcedir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
