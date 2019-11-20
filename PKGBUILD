# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>

pkgname=flipper
pkgver=0.28.0
pkgrel=1
pkgdesc="A desktop debugging platform for mobile (iOS, Android) developers. "
arch=('any')
url="https://fbflipper.com/"
license=('MIT')
depends=('yarn')
source=("git+https://github.com/facebook/flipper.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/flipper"
  yarn
  yarn build --linux --version $pkgver
}

package() {
  tdir="$pkgdir/usr/lib/flipper"
  mkdir -p "$tdir"
  unzip "$srcdir/flipper/dist/Flipper-linux.zip" -d "$tdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -r -s "$tdir/flipper" "$pkgdir/usr/bin/flipper"
}
