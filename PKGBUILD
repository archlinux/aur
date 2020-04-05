# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rclone-browser-git
pkgver=1.8.0.r378
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser/'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/kapitainsky/RcloneBrowser.git")
sha256sums=('SKIP')
makedepends=('cmake' 'git')
depends=('qt5-base' 'rclone')

pkgver() {
  cd ${pkgname%-git}
   printf %s.r%s $(cat VERSION) $(git rev-list --count HEAD)
}

build() {
  [[ -d build ]] || mkdir build
  cd build
  cmake ../${pkgname%-git} -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  cmake --build . --target install
  install -Dm644 "$srcdir"/${pkgname%-git}/LICENSE \
          "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
