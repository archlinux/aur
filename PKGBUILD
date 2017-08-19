# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: maz-1 <loveayawaka@gmail.com>

pkgname=waifu2x-converter-qt-git
pkgver=26.8707e34
pkgrel=1
pkgdesc="Qt frontend of waifu2x."
arch=('x86_64' 'i686')
url='https://github.com/khws4v1/waifu2x-converter-qt'
license=('GPL2')
depends=('waifu2x'
         'qt5-base'
         'libnotify'
         )
makedepends=('git')
provides=('waifu2x-converter-qt')
conflicts=('waifu2x-converter-qt')
source=('git+https://github.com/khws4v1/waifu2x-converter-qt.git'
        'waifu2x.png'
        'waifu2x-converter-qt.desktop'
        )
sha256sums=('SKIP'
            'bc428c18612786a89c2240866f7c96cee617c3ee9c9c3c0695463f7732c081b8'
            'd6fddf442cf217da3f71c08989276b8a7c1f00740cc2c6df49aab958b6abf8ba'
            )

pkgver() {
  cd waifu2x-converter-qt
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../waifu2x-converter-qt
  make
}

package() {
  install -Dm755 build/waifu2x-converter-qt "${pkgdir}/usr/bin/waifu2x-converter-qt"
  install -Dm644 waifu2x.png "${pkgdir}/usr/share/pixmaps/waifu2x.png"
  install -Dm644 waifu2x-converter-qt.desktop "${pkgdir}/usr/share/applications/waifu2x-converter-qt.desktop"
}
