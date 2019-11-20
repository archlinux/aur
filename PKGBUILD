# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>

pkgname=flipper
pkgver=0.28.0
pkgrel=2
pkgdesc="A desktop debugging platform for mobile (iOS, Android) developers. "
arch=('any')
url="https://fbflipper.com/"
license=('MIT')
depends=('gtk3' 'libsecret' 'libxss' 'nss')
makedepends=('git' 'yarn')
source=("git+https://github.com/facebook/flipper.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/flipper"
  yarn
  yarn build --linux --version $pkgver
}

package() {
  tdir="$pkgdir/opt/flipper"
  mkdir -p "$tdir"
  cp -r "$srcdir/flipper/dist/linux-unpacked/." "$tdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -r -s "$tdir/flipper" "$pkgdir/usr/bin/flipper"
}
