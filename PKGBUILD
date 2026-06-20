# Maintainer: dressedinblack5 <dressedinblack5@proton.me>
pkgname=attack-shark-x11-electron
pkgver=1.4.1
<<<<<<< HEAD
pkgrel=2
=======
pkgrel=1
>>>>>>> e99b48c (upstream to v1.4.1)
pkgdesc="Cross-platform driver for the Attack Shark X11 gaming mouse with Electron GUI"
arch=('x86_64')
url="https://github.com/dressedinblack5/attack-shark-x11-electron"
license=('MIT')
depends=('electron' 'libusb')
makedepends=('bun' 'rust')
options=('!strip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2839d8ad563321642706eea80f08bf3f16b478bf6e385cd9d3e504a43e83b86')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  bun install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  bun run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r out/* "$pkgdir/usr/lib/$pkgname/"

  cp -a node_modules "$pkgdir/usr/lib/$pkgname/"
  cp package.json "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/attack-shark-x11-electron"
  echo 'exec electron /usr/lib/attack-shark-x11-electron/main/index.js "$@"' >> "$pkgdir/usr/bin/attack-shark-x11-electron"
  chmod +x "$pkgdir/usr/bin/attack-shark-x11-electron"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/attack-shark-x11-electron.desktop" "$pkgdir/usr/share/applications/attack-shark-x11-electron.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/attack-shark-x11.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/attack-shark-x11.svg"
}
