# Maintainer: Jo De Boeck <deboeck.jo@gmail.com>

pkgname=big-launcher-git
pkgver=f8935c0
pkgrel=1
makedepends=('cmake')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'spdlog' 'fmt' 'libwebp' 'harfbuzz' 'libinih' 'libxml2')
provides=('big-launcher')
conflicts=('big-launcher')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Launcher for the big screen"
license=('MIT')
source=('git+https://github.com/complexlogic/big-launcher' 'https://github.com/complexlogic/big-launcher/files/10326572/assets.zip')
url='https://github.com/complexlogic/big-launcher'
md5sums=('SKIP' '86c72ff76831c1a458924f48cb1b7d43')

pkgver() {
  cd "$srcdir/big-launcher"
  git rev-parse --short HEAD
}

build() {
  mkdir -p "$srcdir/big-launcher/build"
  cd "$srcdir/big-launcher/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make

}

package() {
  unzip -uq assets.zip
  install -Dm 755 "$srcdir/big-launcher/build/big-launcher" "$pkgdir/usr/bin/big-launcher"
  install -Dm 655 "assets/background.svg" "${pkgdir}/usr/share/big-launcher/assets/background.svg"
  install -d ${pkgdir}/usr/share/big-launcher/assets/{fonts,icons,sounds}
  install -D assets/fonts/* "${pkgdir}/usr/share/big-launcher/assets/fonts"
  install -Dm 655 assets/icons/* "${pkgdir}/usr/share/big-launcher/assets/icons"
  install -Dm 655 assets/sounds/* "${pkgdir}/usr/share/big-launcher/assets/sounds"
}
