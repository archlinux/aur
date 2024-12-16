# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-util-dfm-git
pkgver=1.3.8.r0.g27e2ad5
pkgrel=1
pkgdesc='Deepin File Manager utilities (libdfm-io, libdfm-mount and libdfm-burn) developed by UnionTech Software Technology Co., Ltd'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/util-dfm"
license=('GPL3')
depends=(
    'libisoburn'
    'libmediainfo'
    'qt5-base'
    'udisks2'
    'glib2'
    'gcc-libs'
    'util-linux-libs'
    'libsecret'
)
makedepends=('boost' 'cmake' 'ninja' 'qt5-tools')
groups=('deepin-git')
provides=('deepin-util-dfm')
conflicts=('deepin-util-dfm')
source=("$pkgname::git+https://github.com/linuxdeepin/util-dfm")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname || exit
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname || exit
  cmake -G Ninja -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname || exit
  DESTDIR="$pkgdir" cmake --install build
}
