pkgname=cs_translate
pkgver=1.0.0
pkgrel=1
pkgdesc="CS2 console.log auto translator for chat messages (console-only, Linux + Windows)."
arch=('any')
url="https://github.com/MeckeDev/cs_translate"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a698931a396f37b5a6a5e2c6ccd9b719d1d83f09ac32bfe681ef09605285908e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install app into /usr/lib/cs_translate
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  # Create launcher in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/cs_translate" << 'EOF'
#!/bin/sh
exec node /usr/lib/cs_translate/bin/cs.translate.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/cs_translate"
}
