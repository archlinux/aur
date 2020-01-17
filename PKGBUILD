# Maintainer: Christoph Haag <christoph.haag@collabora.com>

pkgname=kdeplasma-applets-xrdesktop-git
pkgver=26.61bafae
pkgrel=1
pkgdesc="xrdesktop applet for KDE Plasma"
url="https://gitlab.freedesktop.org/xrdesktop"
license=('GPL')
depends=('plasma-desktop' 'kwin-effect-xrdesktop-git')
makedepends=('cmake' 'extra-cmake-modules')
source=($pkgname::'git+https://gitlab.freedesktop.org/xrdesktop/kdeplasma-applets-xrdesktop.git')
md5sums=('SKIP')
arch=('any')

build() {
  mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  cmake -DCMAKE_INSTALL_PREFIX="`kf5-config --prefix`" ../kdeplasma-applets-xrdesktop-git
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd $pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

