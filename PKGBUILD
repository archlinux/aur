pkgname=sentype
pkgver=0.1.1
pkgrel=1
pkgdesc="SenType — simple terminal typing game"
arch=('any')
url="https://github.com/rumyp/sentype"
license=('MIT')
depends=('python')
source=("https://github.com/rumyp/sentype/releases/download/${pkgver}/sentype-${pkgver}.tar.gz")
sha256sums=('a9bf203debea91b7623846cbe85281f279fadf5711879942a9fb79411c2f36c6')

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
