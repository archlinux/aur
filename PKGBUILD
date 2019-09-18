# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser
pkgver=1.4.1
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("https://github.com/kapitainsky/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('7051853e70d1d2adbb9714d8975b4c982a9734d7949a154be845569df5a89d53')
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
