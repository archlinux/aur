# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdebase-git
pkgver=1.1.2r6075.a40a9a0de
pkgrel=1
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://quickgit.kde.org/?p=kde1-kdebase.git"
license=("GPL2")
groups=('kde1')
depends=('qt1' 'kde1-kdelibs' 'libjpeg' 'libtiff' 'perl')
makedepends=('cmake' 'git')
provides=('kde1-kdebase')
conflicts=('kde1-kdebase')
source=("git://anongit.kde.org/kde1-kdebase.git")
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
  cmake "$srcdir"/kde1-kdebase -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde1-kdebase
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
