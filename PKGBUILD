# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonnet-git
pkgver=r200.edf5dbe
pkgrel=2
pkgdesc='Sonnet'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/sonnet'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'qt5-tools' 'hunspell' 'aspell' 'hspell' 'git') # 'livvoikko'
optdepends=('hunspell: spell checking via hunspell' 'aspell: spell checking via aspell' 'hspell: spell checking for Hebrew')
 # 'libvoikko: spell checking for Finnish via Voikko')
groups=('kf5')
conflicts=(sonnet)
provides=(sonnet)
source=('git://anongit.kde.org/sonnet.git')
md5sums=('SKIP')

pkgver() {
  cd sonnet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../sonnet \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
