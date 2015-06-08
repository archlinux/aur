# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ksshaskpass-git
pkgver=r30.d44b1e0
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet and kpassworddialog'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/ksshaskpass'
license=(LGPL)
depends=(kwallet)
makedepends=(extra-cmake-modules git python kdoctools)
conflicts=(ksshaskpass)
provides=(ksshaskpass)
source=('git://anongit.kde.org/ksshaskpass.git' 'ksshaskpass.sh')
md5sums=('SKIP'
         'aef2815fb704c98737f23eead3b4e894')

pkgver() {
  cd ksshaskpass
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ksshaskpass \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm 755 "$srcdir"/ksshaskpass.sh "$pkgdir"/etc/profile.d/ksshaskpass.sh
}
