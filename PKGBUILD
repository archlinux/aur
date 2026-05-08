pkgname=sentype
pkgver=0.1.1
pkgrel=1
pkgdesc="SenType — simple terminal typing game"
arch=('any')
url="https://github.com/rumyp/sentype"
license=('MIT')
depends=('python')
source=("https://github.com/rumyp/donkeytype/releases/download/${pkgver}/donkeytype-${pkgver}.tar.gz")
sha256sums=('d32e0fcdacf87c10c76303a924b4d266b320435342ae2d1199412153f7134df4')

build() { :; }

package() {
  install -d "$pkgdir/usr/share/sentype"
  if [ -d "$srcdir/donkeytype-${pkgver}" ]; then
    cp -r "$srcdir/donkeytype-${pkgver}/"* "$pkgdir/usr/share/sentype/"
  else
    cp -r "$srcdir"/* "$pkgdir/usr/share/sentype/"
  fi
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<'WRAPPER'
#!/usr/bin/env bash
exec python3 /usr/share/sentype/game.py "$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
