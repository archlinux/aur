# Maintainer: Christoph Haag <christoph.haag@collabora.com>

pkgname=plasma5-applets-xrdesktop-git
pkgver=0.14.0.r2.gb4eda0a
pkgrel=1
pkgdesc="xrdesktop applet for KDE Plasma"
url="https://gitlab.freedesktop.org/xrdesktop/kdeplasma-applets-xrdesktop"
license=('GPL-2.0-or-later')
depends=('plasma-desktop' 'kwin-effect-xrdesktop-git' 'qt6-declarative')
makedepends=('cmake' 'extra-cmake-modules')
replaces=('kdeplasma-applets-xrdesktop-git')
source=($pkgname::'git+https://gitlab.freedesktop.org/xrdesktop/kdeplasma-applets-xrdesktop.git')
md5sums=('SKIP')
arch=('any')

pkgver() {
  cd "$srcdir"/plasma5-applets-xrdesktop-git
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  cmake -DCMAKE_INSTALL_PREFIX="`kf5-config --prefix`" ../plasma5-applets-xrdesktop-git
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

