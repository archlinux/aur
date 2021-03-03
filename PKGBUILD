# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dooble
pkgver=2021.02.20
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
license=('BSD')
depends=('qt5-webengine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textbrowser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c7519b90b084566b4f2229179f39e5c29d988fc1ad098ff9f8d2251fa0afbb25')

prepare() {
  cd $pkgname-$pkgver/2.x
  sed -i 's|Categories=Web|Categories=Network;Qt;WebBrowser;|
          s|Exec=.*|Exec=dooble|
          s|Icon=.*|Icon=dooble|' dooble.desktop
  sed -i 's|QString path(QDir::currentPath());|QString path("/usr/share/dooble");|' Source/dooble_settings.cc
}

build() {
  cd $pkgname-$pkgver/2.x
  qmake dooble.pro
  make
}

package() {
  cd $pkgname-$pkgver/2.x
  install -Dm755 Dooble "$pkgdir/usr/bin/dooble"
  install -Dm644 Icons/Logo/dooble.png "$pkgdir/usr/share/pixmaps/dooble.png"
  install -Dm644 dooble.desktop "$pkgdir/usr/share/applications/dooble.desktop"
  install -Dm644 -t "$pkgdir/usr/share/dooble/Translations" Translations/dooble_*.qm
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/dooble/LICENSE"
}
