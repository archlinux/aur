# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickgui
pkgver=1.1.3
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
md5sums=('078e80d7083080676057799ff6bab50a')

package() {
  cd "$pkgname-$pkgver"

  flutter build linux --release

  install -Dm755 build/linux/x64/release/bundle/quickgui "$pkgdir/opt/$pkgname/quickgui"

  cp -R build/linux/x64/release/bundle/data "$pkgdir/opt/$pkgname"
  cp -R build/linux/x64/release/bundle/lib "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/quickgui "$pkgdir/usr/bin/quickgui"
}
