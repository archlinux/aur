# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Vaporeon <vaporeon@vaporeon.io>

pkgname=kde1-kdebase-git
pkgver=1.1.2r6137.849cc4d1a
pkgrel=1
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/kde1-kdebase"
license=("GPL2")
groups=('kde1')
depends=('qt1' 'kde1-kdelibs' 'libjpeg' 'libtiff' 'perl' 'pulseaudio' 'glu' 'libxpm')
makedepends=('cmake' 'git')
provides=('kde1-kdebase')
conflicts=('kde1-kdebase')
source=("git+https://invent.kde.org/historical/kde1-kdebase.git")
md5sums=('SKIP')

pkgver() {
  cd kde1-kdebase
  printf "1.1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake ../kde1-kdebase \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd ../kde1-kdebase
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
