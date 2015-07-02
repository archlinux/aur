# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=massif-visualizer-git
pkgver=337.f88d73c
pkgrel=2
pkgdesc="Massif data visualization tool"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/sdk/massif-visualizer"
license=('GPL2')
depends=('kdebase-runtime' 'kgraphviewer')
makedepends=('git' 'cmake' 'automoc4')
provides=('massif-visualizer')
conflicts=('massif-visualizer')
install=massif-visualizer.install
source=('git+git://anongit.kde.org/massif-visualizer')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/massif-visualizer"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/massif-visualizer"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    .
  make
}

package() {
  cd "$srcdir/massif-visualizer"
  make DESTDIR="$pkgdir/" install
} 
