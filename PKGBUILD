# Maintainer: You <you@example.com>
pkgname=donkeytype
pkgver=0.1.0
pkgrel=1
pkgdesc="DonkeyType — simple terminal typing game"
arch=('any')
url="https://example.com/donkeytype"
license=('MIT')
depends=('python')
source=("donkeytype-${pkgver}.tar.gz")
sha256sums=('2d84f24c73f7b8997c42f0cd453a8501ff56173520a29fffdabec247ce36eeae')

build() {
  :
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  # copy package files into /usr/share/donkeytype
  # If tarball extracts into a subdirectory (donkeytype-0.1.0), copy its contents
  if [ -d "$srcdir/${pkgname}-${pkgver}" ]; then
    cp -r "$srcdir/${pkgname}-${pkgver}/"* "$pkgdir/usr/share/$pkgname/"
  else
    cp -r "$srcdir"/* "$pkgdir/usr/share/$pkgname/"
  fi
  # make main script executable and install wrapper to /usr/bin
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<'WRAPPER'
#!/usr/bin/env bash
exec python3 /usr/share/donkeytype/game.py "$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
