# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefano Avallone <stavallo@gmail.com>

pkgname=kdeplasma-addons-git
pkgver=r7143.27606e4
pkgrel=2
pkgdesc="All kind of addons to improve your Plasma experience"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/kdeplasma-addons'
license=(LGPL)
depends=(plasma-workspace-git)
makedepends=(kdoctools-git extra-cmake-modules-git git purpose kross)
optdepends=('purpose: quickshare applet' 'kross: comic applet' 'quota-tools: disk quota applet')
conflicts=(kdeplasma-addons)
provides=(kdeplasma-addons)
source=('git://anongit.kde.org/kdeplasma-addons.git')
groups=('plasma')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd kdeplasma-addons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdeplasma-addons \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

