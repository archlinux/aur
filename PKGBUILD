pkgname=donkeytype
pkgver=0.1.1
pkgrel=1
pkgdesc="DonkeyType — simple terminal typing game"
arch=('any')
url="https://github.com/rumyp/donkeytype"
license=('MIT')
depends=('python')
source=("donkeytype-${pkgver}.tar.gz")
sha256sums=('d32e0fcdacf87c10c76303a924b4d266b320435342ae2d1199412153f7134df4')

build() { :; }

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  if [ -d "$srcdir/${pkgname}-${pkgver}" ]; then
    cp -r "$srcdir/${pkgname}-${pkgver}/"* "$pkgdir/usr/share/$pkgname/"
  else
    cp -r "$srcdir"/* "$pkgdir/usr/share/$pkgname/"
  fi
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<'WRAPPER'
#!/usr/bin/env bash
exec python3 /usr/share/donkeytype/game.py "$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
