# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser
pkgver=1.4
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("https://github.com/kapitainsky/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('d84880df8639af35c3737b9fa67fbd34c75d2518a51d156f60c4a9ba13c593dd')
makedepends=('cmake')
depends=('qt5-base' 'rclone')

package() {

  cd "$srcdir"/RcloneBrowser-${pkgver}
  sed -i "s/ -Werror//g" src/CMakeLists.txt
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build . --target install

  install -Dm644 "$srcdir"/RcloneBrowser-${pkgver}/LICENSE \
                "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
