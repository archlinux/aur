pkgname=sentype
pkgver=0.2.0
pkgrel=1
pkgdesc="SenType — simple terminal typing game"
arch=('any')
url="https://github.com/rumyp/sentype"
license=('MIT')
depends=('python')
source=("https://github.com/rumyp/sentype/releases/download/${pkgver}/sentype-${pkgver}.tar.gz")
sha256sums=('9ed5d4884fd2f4023e5452e02a57b84bd813473cd174d55735f1ee721d75a427')

build() { :; }

package() {
  install -d "$pkgdir/usr/share/sentype"
  if [ -d "$srcdir/sentype-${pkgver}" ]; then
    cp -r "$srcdir/sentype-${pkgver}/"* "$pkgdir/usr/share/sentype/"
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
