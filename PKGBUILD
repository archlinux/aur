# Maintainer: CamuseCao camusecao@gmail.com
pkgname=cutetranslation-flameshot
pkgver=0.5.0
pkgrel=2
pkgdesc="flameshot 截图版的 Linux 系统上基于 X11 的一款取词翻译软件,帮助用户翻译多种语言的文字。"
arch=('x86_64')
url="https://github.com/jiangzc/CuteTranslation"
license=('GPL3')
depends=('tidy' 'nodejs' 'qt5-multimedia' 'flameshot' 'qt5-declarative' 'libxtst')
makedepends=('git' 'xcb-util' 'qt5-base' 'qt5-x11extras' 'qt5-multimedia')

# optdepends=('libxtst')
conflicts=('cutetranslation')
replaces=()
backup=()
# source=("$url/archive/v$pkgver-$pkgrel.tar.gz" "cutetranslation.desktop")
source=("$url/archive/v$pkgver.tar.gz" "cutetranslation.desktop")
md5sums=('4effa5806d1f7ebd263590c84ee0b966'
         '53dc6fbd71cc3e365405d42820ea9ab5')

prepare() {
# sed -i 's%gnome-screenshot%flameshot%g' $srcdir/CuteTranslation-$pkgver-$pkgrel/src/main.cpp
# sed -i 's%gnome-screenshot -a -f /tmp/ocr > /dev/null 2>&1%flameshot gui \-r > /tmp/ocr%g' $srcdir/CuteTranslation-$pkgver-$pkgrel/template/screenshot.sh
sed -i 's%gnome-screenshot%flameshot%g' $srcdir/CuteTranslation-$pkgver/src/main.cpp
sed -i 's%gnome-screenshot -a -f /tmp/ocr > /dev/null 2>&1%flameshot gui \-r > /tmp/ocr%g' $srcdir/CuteTranslation-$pkgver/template/screenshot.sh
# flameshot gui \-r >
}

build() {
#   cd $srcdir/CuteTranslation-$pkgver-$pkgrel
  cd $srcdir/CuteTranslation-$pkgver
  mkdir -p build && cd build
  qmake ../ && make
}

package() {
#   cd $srcdir/CuteTranslation-$pkgver-$pkgrel
  cd $srcdir/CuteTranslation-$pkgver
  cp ./build/CuteTranslation ./template
  install -Dm644 ./template/CuteTranslation.svg ${pkgdir}/usr/share/icons/CuteTranslation.svg
  install -Dm644 $srcdir/cutetranslation.desktop $pkgdir/usr/share/applications/cutetranslation.desktop
  install -D ./template/* -t ${pkgdir}/opt/CuteTranslation
}

