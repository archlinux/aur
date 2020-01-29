# Maintainer: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=latte-dock-git
_gitname=latte-dock
pkgver=r3698.bc2e0709
pkgrel=1
pkgdesc='Latte is a dock based on plasma frameworks that provides an elegant and intuitive experience for your tasks and plasmoids'
arch=('i686' 'x86_64')
url='https://cgit.kde.org/latte-dock.git/'
license=('GPL')
depends=('plasma-framework' 'plasma-desktop')
optdepends=('libunity: quicklists, counters, and progress bars for apps using libunity')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
conflicts=('latte-dock')
provides=('latte-dock')
source=("git://anongit.kde.org/latte-dock.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   
}

build() {
   cd ${_gitname}

   mkdir build && cd build
   cmake -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Release ..

  
}

package() {
  
   make -C ${_gitname}/build DESTDIR=${pkgdir} install

}
