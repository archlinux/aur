# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-gui
pkgver=2.2
pkgrel=3
pkgdesc="Official UI for Viper4Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'mesa' 'qt5-multimedia' 'qt5-svg' 'viper4linux')
optdepends=('libappindicator-gtk3: tray icon support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('b3cb390394b573a69c55169637bf21c827984165b8965a6033ed9cfc5e148c0f'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

build() {
  cd "Viper4Linux-GUI-$pkgver"
  qmake V4L_Frontend.pro \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS"
  make PREFIX=/usr
}

package() {
  cd "Viper4Linux-GUI-$pkgver"
  install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
