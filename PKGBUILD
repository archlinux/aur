 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=plasma5-applets-journalviewer-git
pkgver=r11.04a119d
pkgrel=1
pkgdesc='simple journald log viewer plasmoid'
arch=('i686' 'x86_64')
url='https://gitlab.com/Aiwendil/JournalViewer'
license=('GPL3')
depends=('systemd' 'qt5-base' 'plasma-framework' 'gettext')
makedepends=('cmake' 'extra-cmake-modules' 'pkg-config')
source=("git+https://gitlab.com/Aiwendil/JournalViewer.git")
sha256sums=('SKIP')

pkgver() {
  cd JournalViewer
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"/JournalViewer/
  
  mkdir build && cd build
   
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  cd "$srcdir"/JournalViewer/build

  make DESTDIR="$pkgdir" install
}
