# Maintainer: Romullo <developermarsh@gmail.com>

_branch='develop'

pkgname=paley
pkgver=0.0.0
pkgrel=1
epoch=0
pkgdesc="A simple color picker for Wayland."
arch=("x86_64")
url="https://github.com/hiukky/paley"
license=('MIT')
source=("https://github.com/hiukky/paley/archive/$_branch.zip")
validpgpkeys=()
depends=('grim' 'slurp' 'electron')
makedepends=('git' 'yarn')
md5sums=('SKIP')

prepare() {
	cd $srcdir/$pkgname-$_branch
  yarn
}

build() {
  cd $srcdir/$pkgname-$_branch
  yarn electron-build
}

package() {
	cd $srcdir/$pkgname-$_branch

  install -Dm644 "out/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
  install -Dm644  "resources/$pkgname.png" "$pkgdir/usr/share/$pkgname/$pkgname.png"
  install -Dm644  "meta/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -dm755 "$pkgdir/usr/bin/"

  bash -c "echo -e '#!/bin/bash\n exec electron /usr/lib/$pkgname/app.asar "$@"' > $pkgdir/usr/bin/$pkgname"

  chmod +x "$pkgdir/usr/bin/$pkgname"
}
