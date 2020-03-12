# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktextwidgets-git
pkgver=v4.100.0.rc1.r259.g598e8bf
pkgrel=1
pkgdesc='KTextWidgets'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/ktextwidgets'
license=('LGPL')
depends=('kcompletion-git' 'kservice-git' 'kiconthemes-git' 'sonnet-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(ktextwidgets)
provides=(ktextwidgets)
source=('git://anongit.kde.org/ktextwidgets.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktextwidgets \
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
