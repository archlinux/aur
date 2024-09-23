# Maintainer: Mindia Edisherashvili <mindia.e@aol.com>
pkgname=ourbible
pkgver=0.17.10
pkgrel=1
epoch=
pkgdesc="Bible viewer app with GUI which uses MyBible Android app's modules which you can add"
arch=('x86_64')
url="https://github.com/mindiae/ourbible"
license=('GPL-3.0')
depends=('sqlite' 'go' 'gtk3' 'webkit2gtk-4.1' 'ttf-font-awesome')
makedepends=('git' 'go' 'gtk3' 'webkit2gtk-4.1')
source=("https://github.com/mindiae/ourbible/archive/refs/tags/0.17.10.tar.gz")
sha256sums=("638ef6c6ba8e4fdbec6e7c6423ce93d65091e05ece08225f48ee9ecf32511358")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o build/$pkgname ./cmd/webview/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/local/bin/$pkgname"
  local target_dir="/usr/local/share/$pkgname"

  install -d "$pkgdir/usr/share/applications"
  mv "ourbible.desktop" "$pkgdir/usr/share/applications"
  install -d "$pkgdir/$target_dir/static"
  mv "static/"* "$pkgdir/$target_dir/static"
  install -d "$pkgdir/$target_dir/database"
  mv "database/"* "$pkgdir/$target_dir/database"
  mv "storage.sqlite3" "$pkgdir/$target_dir/"
}
