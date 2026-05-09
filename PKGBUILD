# Maintainer: alejopek alejopek62@gmail.com
pkgname=sys-dashboard
pkgver=1.0.4
pkgrel=1
pkgdesc="A professional real-time system monitoring dashboard built with Node.js and Electron"
arch=('x86_64')
url="https://github.com/Alejopek/Sys-Dashboard-"
license=('ISC')
depends=('nodejs' 'npm')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  npm install
  npx electron-builder --linux dir
}

package() {
  cd "$pkgname"
  
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  install -Dm644 "public/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  
  echo "[Desktop Entry]
Name=Sys Dashboard
Comment=Real-time system monitoring tool
Exec=$pkgname
Icon=$pkgname
Type=Application
Terminal=false
Categories=System;Monitor;" > "$pkgname.desktop"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
