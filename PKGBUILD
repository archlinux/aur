# Maintainer: <francois@francoisvankempen.com>
options=('!debug')
pkgname=drawboard-pdf
pkgver=1.0.0
pkgrel=1
pkgdesc="Electron wrapper for Drawboard PDF software"
arch=('x86_64')
url=""
license=('MIT')  # Change if needed
depends=('electron' 'gtk3')
makedepends=('nodejs' 'npm')
source=("https://github.com/bjorkbjork/DrawboardPDF-Linux/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz") # Replace with your release source if hosting
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  npm ci
  npx electron-packager . "$pkgname" --platform=linux --arch=x64 --icon=assets/icon.png --out=dist/
}

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r "dist/$pkgname-linux-x64/"* "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$pkgdir/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

