# Maintainer: Martin

pkgname=kde1-kdegraphics-git
pkgver=1.1.2r1129.170e6a7
pkgrel=1
pkgdesc="Historical copy of the graphics module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://quickgit.kde.org/?p=kde1-kdegraphics.git"
license=("GPL2")
groups=('kde1')
depends=('kde1-kdelibs' 'giflib')
makedepends=('cmake' 'git')
provides=('kde1-kdegraphics')
conflicts=('kde1-kdegraphics')
source=("git+https://anongit.kde.org/kde1-kdelibs.git")
md5sums=('SKIP')

# Mirror, in case it fails:
#source=("git+https://github.com/KDE/kde1-kdegraphics.git")

pkgver() {
  cd kde1-kdegraphics
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
  cmake "$srcdir"/kde1-kdegraphics -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde1-kdegraphics
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
