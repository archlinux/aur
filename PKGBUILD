# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kiconedit
pkgver=4.4.0
pkgrel=5
pkgdesc="KDE icon editor"
arch=('i686' 'x86_64')
url="http://www.kde.org/applications/graphics/kiconedit"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('pkgconfig' 'cmake' 'automoc4')
install=$pkgname.install
source=(http://download.kde.org/stable/extragear/$pkgname-$pkgver.tar.bz2)
md5sums=('f2db6aff093cea2fcefceb3eb02a94c3')

build() {
  cd $pkgname-$pkgver

  # Fix compilation handbook issue
  sed -i '/add_subdirectory( hu_kiconedit\/kiconedit )/d' doc-translations/CMakeLists.txt

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

