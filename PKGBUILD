# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-query-git
pkgver=r5.340a45b
pkgrel=1
pkgdesc='Use this tool to query wallets from the command-line interface'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/utils/kwallet-query'
license=('LGPL')
depends=('kwallet')
makedepends=('extra-cmake-modules' 'git')
conflicts=('kwallet-query')
source=('git://anongit.kde.org/kwallet-query')
md5sums=('SKIP')

pkgver() {
  cd kwallet-query
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwallet-query \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
