# Maintainer: NotFrost <notfrost@github>

pkgname=frozen-rpc
pkgver=1.0.0.beta.2
pkgrel=2
pkgdesc="Cross-platform Discord Rich Presence injector with OAuth2 and Gateway support"
arch=('x86_64')
url="https://github.com/FrostX2/frozen-rpc"
license=('MIT')
depends=('electron')
makedepends=('git' 'npm')
options=('!strip' '!debug')
source=("$pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  npm install --ignore-scripts
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname/"
  rm -rf "$pkgdir/usr/lib/$pkgname/.git"

  install -dm755 "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
  echo "exec /usr/bin/electron /usr/lib/$pkgname --no-sandbox" >> "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgdir/usr/lib/$pkgname/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  install -Dm644 "$pkgdir/usr/lib/$pkgname/shell/frozen-rpc.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
