# Maintainer: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=latte-dock-git
_gitname=latte-dock
pkgver=r6036.e1e8c47a
pkgrel=1
pkgdesc='Latte is a dock based on plasma frameworks that provides an elegant and intuitive experience for your tasks and plasmoids'
arch=('x86_64')
url='https://invent.kde.org/plasma/latte-dock'
license=('GPL')
depends=('plasma-framework' 'plasma-workspace' 'kirigami2' 'knewstuff' 'hicolor-icon-theme' 'plasma-wayland-protocols')
optdepends=('libunity: quicklists, counters, and progress bars for apps using libunity')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
conflicts=('latte-dock')
provides=('latte-dock')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   
}

build() {
   cd ${_gitname}

   mkdir -p build && cd build
   cmake -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Master ..

  
}

package() {
  
   make -C ${_gitname}/build DESTDIR=${pkgdir} install

}
