# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Sebastien Luttringer <seblu+arch@seblu.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kiconedit
pkgver=4.4.0
pkgrel=7
pkgdesc="KDE icon editor"
arch=('x86_64')
url="https://download.kde.org/stable/extragear/"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake' 'pkgconfig')
source=(http://download.kde.org/stable/extragear/$pkgname-$pkgver.tar.bz2)
sha256sums=('2bc42efa3c89bdd14f996ccfedcc11c97e907bb7c97657b93e19e52f464ee50c')

prepare() {
  cd $pkgname-$pkgver

  # Fix compilation handbook issue
  sed -i '/add_subdirectory( hu_kiconedit\/kiconedit )/d' doc-translations/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

