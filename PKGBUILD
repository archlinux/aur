# Maintainer: Ghabry <gabriel-aur mastergk de>

pkgname=(xyz-thumbnailer-kde-git)
pkgver=r210.d921132
pkgrel=1
pkgdesc="KDE Thumbnail provider for RPG Maker 2000/2003 XYZ image files (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org/tools/"
license=('MIT')
makedepends=('git' 'cmake' 'extra-cmake-modules')
depends=('dolphin' 'zlib')
provides=('xyz-thumbnailer-kde')
conflicts=('xyz-thumbnailer-kde')
source=($pkgname::"git+https://github.com/EasyRPG/Tools.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $pkgname/xyz-thumbnailer/kde
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -Dm0644 $pkgname/xyz-thumbnailer/kde/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
