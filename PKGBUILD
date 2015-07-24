# Maintainer: frames <markkuehn at outlook dot com> 

pkgname=kgpg-git
pkgver=r2566.87fa48f
pkgrel=1
pkgdesc='KGpg is a simple interface for GnuPG, a powerful encryption utility.  Git version.'
arch=(i686 x86_64)
url='https://utils.kde.org/projects/kgpg/'
license=(GPL)
depends=(gnupg kdepimlibs)    #Can also work with kdepimlibs-git
makedepends=(git boost)
provides=('kdeutils-kgpg' 'kgpg')
conflicts=('kdeutils-kgpg')
source=("git://anongit.kde.org/kgpg")
sha256sums=('SKIP')

pkgver() {
  cd kgpg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kgpg \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
