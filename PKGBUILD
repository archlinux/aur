# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickgui
pkgver=1.1.4
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=(any)
url="https://github.com/quickgui/quickgui"
license=('unknown')
depends=('quickemu')
makedepends=('flutter' 'cmake' 'ninja' 'clang')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.xz"::"https://github.com/quickgui/quickgui/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7d40a2cfeb0039d7fd682ee970d8f0ba')

package() {
  cd "$pkgname-$pkgver"

  flutter build linux --release

  install -Dm755 build/linux/x64/release/bundle/quickgui "$pkgdir/opt/$pkgname/quickgui"
  install -Dm644 assets/resources/quickgui.desktop "${pkgdir}/usr/share/applications/quickgui.desktop"
  install -Dm644 assets/resources/quickgui_512.png "${pkgdir}/usr/share/icons/quickgui_512.png"

  cp -R build/linux/x64/release/bundle/data "$pkgdir/opt/$pkgname"
  cp -R build/linux/x64/release/bundle/lib "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/quickgui "$pkgdir/usr/bin/quickgui"
}
