# Maintainer: Jiri Tyr <jiri.tyr at gmail dot com>

pkgname=plasma5-applets-tempreader-widget-git
_pkgname=plasma5-applets-tempreader-widget
_gitpkgname=plasma-tempreader
pkgver=r7.46172f6
pkgrel=1
pkgdesc="Plasmoid for Plasma 5 which shows temperature from DS18B20 sensors."
arch=('i686' 'x86_64')
url="https://github.com/jtyr/$_gitpkgname"
license=('MIT')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}" 'plasma-applet-tempreader-widget-git')
provides=("${_pkgname-*}")
source=("git+https://github.com/jtyr/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitpkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitpkgname"

  mkdir -p build
  cd build
  rm -rf *

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "$srcdir/$_gitpkgname/build"
  make install DESTDIR="$pkgdir"

  install -Dm644 "$srcdir/$_gitpkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_gitpkgname/README.md" "$pkgdir/usr/share/doc/$pkgname"
}
