# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kiconedit
pkgver=4.4.0
pkgrel=6
pkgdesc="KDE icon editor"
arch=('x86_64')
url="https://download.kde.org/stable/extragear/"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake' 'pkgconfig')
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

