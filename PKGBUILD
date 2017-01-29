# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=rclone-browser
pkgver=1.0.0
pkgrel=2
pkgdesc='Simple cross-platform GUI for rclone'
url='https://mmozeiko.github.io/RcloneBrowser/'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("https://github.com/mmozeiko/RcloneBrowser/archive/${pkgver}.tar.gz"
        'rclone-browser.desktop')
sha256sums=('b3e718180ad9475517da55b5b7bbeb83434a2b621bc4b0e924870764cf77bf50'
            'efb243a0865106562f2e4cba14da0c5bcbf4387762bd6107067e3cc6d467ed06')
makedepends=('cmake')
depends=('qt5-base' 'rclone')

package() {

  cd "$srcdir"/RcloneBrowser-${pkgver}
  mkdir -p build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DRCLONE_BROWSER_VERSION=${pkgver}
  cmake --build .

  install -Dm755 "$srcdir"/RcloneBrowser-${pkgver}/build/build/rclone-browser \
                "$pkgdir"/usr/bin/rclone-browser

  install -Dm644 "$srcdir"/RcloneBrowser-${pkgver}/LICENSE \
                "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE

  install -Dm644 "$srcdir"/rclone-browser.desktop \
                "$pkgdir"/usr/share/applications/rclone-browser.desktop
}
