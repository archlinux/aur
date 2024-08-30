# Maintainer: Mindia Edisherashvili <mindia.e@aol.com>
pkgname=ourbible
pkgver=0.10.1
pkgrel=0
epoch=
pkgdesc="bible viewer app with GUI and web interface which uses MyBible android app's modules"
arch=('x86_64')
url="https://github.com/mindiae/ourbible"
license=('LGPL' 'GPL')
depends=('sqlite' 'go')
makedepends=('git')
source=("https://github.com/mindiae/ourbible/archive/refs/tags/0.10.1.tar.gz")
sha256sums=("6088e63f9f021cfb8db9bc60d659151d6cb77798a37c8236e47210ca28ef0cc0")

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
