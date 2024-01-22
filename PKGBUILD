# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=viper4linux-gui-git
pkgver=2.2.r24.g2d0c84d
pkgrel=1
pkgdesc="Official UI for Viper4Linux"
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux-GUI"
license=('GPL-3.0-or-later')
depends=('gst-plugins-bad-libs' 'mesa' 'qt5-multimedia' 'qt5-svg' 'viper4linux-git')
makedepends=('git')
optdepends=('libappindicator-gtk3: tray icon support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/Viper4Linux-GUI.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '05a46b8ad3508e9275388d9255247cda09977eb8087fa5dd96d04bc25c17a77c')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake-qt5 V4L_Frontend.pro
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 V4L_Frontend "$pkgdir/usr/bin/viper-gui"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 viper.png "$pkgdir/usr/share/pixmaps/viper-gui.png"
}
