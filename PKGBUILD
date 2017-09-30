 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=plasma5-applets-journalviewer-git
_gitname=JournalViewer
pkgver=r12.07536d5
pkgrel=1
pkgdesc='simple journald log viewer plasmoid'
arch=('i686' 'x86_64')
url='https://gitlab.com/Aiwendil/JournalViewer'
license=('GPL3')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'pkg-config' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  
 ( 
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 )
}

build() {
   cd ${srcdir}/${_gitname}
  
   mkdir build && cd build
   
   cmake -DCMAKE_INSTALL_PREFIX=/usr ..
   make
    
  }

package() {
   cd ${srcdir}/${_gitname}/build
   make DESTDIR=${pkgdir} install
}
