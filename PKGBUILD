# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=treeland-protocols-git
_pkgname=treeland-protocols
pkgver=0.4.r0.g75efb88
pkgrel=1
pkgdesc='treeland protocol xml files'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/treeland-protocols"
license=('LGPL3')
makedepends=('git'
             'cmake'
             'ninja'
)
conflicts=('treeland-protocols')
provides=('treeland-protocols')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/treeland-protocols.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
