# Maintainer: Mindia Edisherashvili <mindia.e@aol.com>
pkgname=ourbible
pkgver=0.10.0
pkgrel=0
epoch=
pkgdesc="bible viewer app with GUI and web interface uses MyBible android app's modules"
arch=('x86_64')
url="https://github.com/mindiae/ourbible"
license=('LGPL' 'GPL')
depends=('sqlite' 'go')
makedepends=('git')
source=("https://github.com/mindiae/ourbible/archive/refs/tags/0.10.0.tar.gz")
sha256sums=("423fe32cdcd8705c35bfc3bc0094d4534fc20e989b68bb4a86b11024f236521b")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o build/$pkgname ./cmd
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
}
