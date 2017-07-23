# Maintainer: T. Witt
pkgname=plasma5-applets-analog24hclock
pkgver=r5.5043d8f
pkgrel=1
pkgdesc="Analog 24h clock"
arch=('any')
url="https://github.com/sleepywitti/analog24hclock-plasmoid/"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('git' 'extra-cmake-modules')
source=("${pkgname}::git+https://github.com/sleepywitti/analog24hclock-plasmoid.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ..
  make
}

package() {
  cd "$srcdir/${pkgname}"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
