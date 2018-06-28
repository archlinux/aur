# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: maz-1 <loveayawaka@gmail.com>

pkgname=waifu2x-converter-qt-git
pkgver=33.dcaeae1
pkgrel=1
pkgdesc="Qt frontend of waifu2x. (GIT version)"
arch=('x86_64')
url='https://github.com/khws4v1/waifu2x-converter-qt'
license=('MIT')
depends=('waifu2x-converter-cpp'
         'qt5-base'
         'libnotify'
         )
makedepends=('git')
provides=('waifu2x-converter-qt')
conflicts=('waifu2x-converter-qt')
source=('git+https://github.com/toyg/waifu2x-converter-qt.git'
        'waifu2x.png'
        'waifu2x-converter-qt.desktop'
        'https://github.com/toyg/waifu2x-converter-qt/pull/3.diff'
        )
sha256sums=('SKIP'
            'bc428c18612786a89c2240866f7c96cee617c3ee9c9c3c0695463f7732c081b8'
            'd6fddf442cf217da3f71c08989276b8a7c1f00740cc2c6df49aab958b6abf8ba'
            '0c2210464615272e0dc62ee0d0992ddb60775cd280e41e675cc8d7722ba1ff24'
            )

pkgver() {
  cd waifu2x-converter-qt
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  mkdir -p build

  patch -d waifu2x-converter-qt -p1 -i "${srcdir}/3.diff"

  cd build
  qmake-qt5 ../waifu2x-converter-qt
}

build() {
  make -C build
}

package() {
  install -Dm755 build/waifu2x-converter-qt "${pkgdir}/usr/bin/waifu2x-converter-qt"
  install -Dm644 waifu2x.png "${pkgdir}/usr/share/pixmaps/waifu2x.png"
  install -Dm644 waifu2x-converter-qt.desktop "${pkgdir}/usr/share/applications/waifu2x-converter-qt.desktop"
  install -Dm644 waifu2x-converter-qt/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
