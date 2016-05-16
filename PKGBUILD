# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=massif-visualizer-git
pkgver=497.65d2fd5
pkgrel=1
pkgdesc="Massif data visualization tool"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/sdk/massif-visualizer"
license=('GPL2')
depends=('qt5-base' 'qt5-svg' 'qt5-xmlpatterns' 'karchive' 'kconfig' \
         'kcoreaddons' 'kparts' 'kio' 'ki18n' 'kdiagram-git')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
provides=('massif-visualizer')
conflicts=('massif-visualizer')
source=('git+git://anongit.kde.org/massif-visualizer')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/massif-visualizer"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/massif-visualizer"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/massif-visualizer"
  make DESTDIR="$pkgdir/" install
} 
