# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=qcomicbook-git
pkgver=0.8.2.85.g2b1748f
pkgrel=1
pkgdesc="QComicBook is a viewer for comic book archives. (GIT version)"
arch=('i686' 'x86_64')
url='http://qcomicbook.org'
license=('GPL')
depends=('qt5-x11extras'
         'desktop-file-utils'
         'poppler-qt5'
         )
optdepends=('unzip'
            'unace'
            'unrar'
            'p7zip'
            'tar'
            )
makedepends=('cmake'
             'git'
             )
provides=('qcomicbook')
conflicts=('qcomicbook')
source=('qcomicbook::git+https://github.com/stolowski/QComicBook.git')
sha1sums=('SKIP')
install=qcomicbook-git.install

pkgver() {
  cd qcomicbook
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
   cd build
   cmake ../qcomicbook \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DCMAKE_BUILD_TYPE=Release

   make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}