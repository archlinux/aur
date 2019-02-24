# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=konqueror-git
pkgver=r14067.4ab571e
pkgrel=1
pkgdesc="KDE File Manager and Web Browser"
arch=(i686 x86_64)
url='https://kde.org/applications/internet/konqueror/'
license=(LGPL)
depends=(dolphin qt5-webengine)
makedepends=(extra-cmake-modules git kdoctools kdesu tidy kdesignerplugin kdelibs4support)
conflicts=(kdebase-konqueror konqueror konqueror-frameworks-git konq-plugins-git konq-plugins-frameworks-git
           libkonq-git libkonq-frameworks-git konq-plugins kdebase-konq-plugins)
provides=(konqueror)
replaces=(konq-plugins-git libkonq-git)
optdepends=('tidy: Tidy HTML plugin' 'kdesu: shell command plugin')
source=('git://anongit.kde.org/konqueror')
md5sums=('SKIP')

pkgver() {
  cd konqueror
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../konqueror \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build/
  make DESTDIR="$pkgdir" install
}
