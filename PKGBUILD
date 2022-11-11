# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickgui
pkgver=1.2.7
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('unknown')
depends=('quickemu' 'zenity')
makedepends=('flutter' 'cmake' 'ninja' 'clang')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.xz"::"https://github.com/quickgui/quickgui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d482f3cc42f2382f2b2961a72d733c92ee7e839e5687157b5acc65025cac69df')

build() {
  cd "$pkgname-$pkgver"

  flutter build linux --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/linux/x64/release/bundle/quickgui "$pkgdir/opt/$pkgname/quickgui"
  install -Dm644 assets/resources/quickgui.desktop "${pkgdir}/usr/share/applications/quickgui.desktop"
  install -Dm644 assets/resources/quickgui_512.png "${pkgdir}/usr/share/icons/quickgui_512.png"

  cp -R build/linux/x64/release/bundle/data "$pkgdir/opt/$pkgname"
  cp -R build/linux/x64/release/bundle/lib "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/quickgui "$pkgdir/usr/bin/quickgui"
}
